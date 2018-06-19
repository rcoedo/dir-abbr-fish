function __dir_abbr_allowed --description "Checks if the file is whitelisted" --argument file
    # File does not exist
    if test ! -e "$file"
        return 1
    end

    set -l script_list $HOME/.config/fish/dir_abbr_allowed

    # Initialize file if needed
    if test ! -e "$script_list"
        touch $script_list
    end

    # Look for occurences in the whitelist
    grep -q (__dir_abbr_file_line $file) $script_list

    return $status
end
