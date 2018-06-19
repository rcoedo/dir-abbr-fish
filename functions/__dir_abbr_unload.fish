function __dir_abbr_unload
    for line in $dir_abbreviations
        set -l params (string split "=" $line);
        abbr -e $params[1] > /dev/null
    end
    set -e dir_abbreviations
end
