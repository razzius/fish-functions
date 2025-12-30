function is-clean-zip --argument zipfile
    if string-empty $zipfile
        error 'is-clean-zip: missing filename'
        return 1
    end

    set first_file (zip -sf $zipfile | row 2)
    set first_file_last_char (echo $first_file | string sub --start=-1)
    test $first_file_last_char = /
end
