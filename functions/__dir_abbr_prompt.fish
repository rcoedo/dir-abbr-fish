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
