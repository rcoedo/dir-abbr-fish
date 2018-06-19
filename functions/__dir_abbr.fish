function __dir_abbr_shorten --description "shortens the file path" --argument file
    echo $file \
    | sed -e "s|^$HOME|~|"
end

function __dir_abbr_confirm --description "Asks the user for confirmation" --argument prompt
    if test -z "$prompt"
        set prompt "Continue?"
    end

    while true
        read -n 1 -l -p 'set_color red; echo -n "$prompt [y/n]: "; set_color normal' confirm

        switch $confirm
            case Y y
                return 0
            case '' N n
                return 1
        end
    end
end

function __dir_abbr_file_line --description "Builds an entry for the dir_abbr whitelist" --argument file
    echo (md5 -q $file)\t"$file"
end

function __dir_abbr_allowed --description "Checks if the file is whitelisted" --argument file
    set -l script_list $HOME/.config/fish/dir_abbr_allowed

    # Initialize file if needed
    if test ! -e "$script_list"
        touch $script_list
    end

    # Look for occurences in the whitelist
    grep -q (__dir_abbr_file_line $file) $script_list

    return $status
end

function __dir_abbr_prompt --description "Asks for confirmation when the file is not whitelisted" --argument file
    # File does not exist
    if test ! -e "$file"
        return 1
    end

    # If the file is not whitelisted, ask for confirmation
    if not __dir_abbr_allowed $file
        if __dir_abbr_confirm "found new abbr file "(__dir_abbr_shorten $file)", allow it?"
            echo (__dir_abbr_file_line $file) >> $HOME/.config/fish/dir_abbr_allowed
        else
            return 1
        end
    end
    return 0
end

function __dir_abbr_load --argument file
    if __dir_abbr_prompt $file
        for line in (cat < $file)
            set -l params (string split "=" $line);
            abbr -a $params[1] $params[2]
        end
    end
end

function __dir_abbr_unload --argument file
    if __dir_abbr_prompt $file
        for line in (cat < $file)
            set -l params (string split "=" $line);
            abbr -e $params[1]
        end
    end
end

function __dir_abbr_handle_dir_change --on-variable dir_abbr_previous_dir
    if test ! -z "$dir_abbr_previous_dir"
        set -l unload $dir_abbr_previous_dir/.abbr
        set -l load (pwd)/.abbr
        if test -e "$unload"
            __dir_abbr_unload $unload
        end
        if test -e "$load"
            __dir_abbr_load $load
        end
    end
end

function __dir_abbr_handle_dirprev --on-variable dirprev
    if status --is-interactive
        set --local previous_dir $dirprev[(count $dirprev)]
        if test ! "$dir_abbr_previous_dir" = "$previous_dir"
            set -g dir_abbr_previous_dir $previous_dir
        end
    end
end

function __dir_abbr
    __dir_abbr_handle_dir_change
    __dir_abbr_handle_dirprev
end
