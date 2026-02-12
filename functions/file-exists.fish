function file-exists --argument file
    set find_path (__completion_find_path_for_token $file)
    set filename (basename $file)
    test (find $find_path -maxdepth 1 -name $filename | count) = 1
end
