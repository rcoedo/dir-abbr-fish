function __dir_abbr_load --argument file
    if __dir_abbr_prompt $file
        for line in (cat < $file)
            set -l params (string split "=" $line);
            abbr -a $params[1] $params[2]
            set -g dir_abbreviations $dir_abbreviations $line
        end
    end
end
