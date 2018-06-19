function dir-abbr-reload --description "reload current dir abbreviations"
    __dir_abbr_unload
    if test -e (pwd)/.abbr
        __dir_abbr_load (pwd)/.abbr
    end
end
