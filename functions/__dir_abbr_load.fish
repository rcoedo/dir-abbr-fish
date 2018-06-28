function __dir_abbr_load --argument file
    if __dir_abbr_prompt $file
        set -g dir_abbr_restore $fish_user_abbreviations
        for line in (cat < $file)
            set -l params (string split -m 1 "=" $line);
            abbr -a $params[1] $params[2]
        end
    end
end
