function __dir_abbr_unload
    if test ! -z "$dir_abbr_restore"
        set -g fish_user_abbreviations $dir_abbr_restore
        set -e dir_abbr_restore
    end
end
