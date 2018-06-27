set -g fish_user_abbreviations

function __dir_abbr_handler --on-variable PWD
    if status --is-interactive
        __dir_abbr_unload
        if test -e (pwd)/.abbr
            __dir_abbr_load (pwd)/.abbr
        end
    end
end

__dir_abbr_handler
