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
