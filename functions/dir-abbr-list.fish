function dir-abbr-list --description "shows currently load dir abbreviations"
    for abbreviation in $dir_abbreviations
        echo $abbreviation
    end
end
