function __dir_abbr_shorten --description "shortens the file path" --argument file
    echo $file | rev | cut -d'/' -f-2 | rev
end
