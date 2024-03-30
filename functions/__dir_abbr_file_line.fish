function __dir_abbr_file_line --description "Builds an entry for the dir_abbr whitelist" --argument file
    echo (md5sum --quiet $file)\t"$file"
end
