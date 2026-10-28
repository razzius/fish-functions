function is-clean-zip --argument zipfile
    if string-empty $zipfile
        error 'is-clean-zip: missing filename'
        return 1
    end

    set first_file (zip -sf $zipfile | row 2 | string trim)

    if not endswith / $first_file
        return 1
    end

    # Exit with error if any files in the zip don't start with the folder name
    zip -sf $zipfile | skip 1 | drop 1 | string trim | not grep -q -v "^$first_file"
end
