function __complete_symlinks
    set find_path (__completion_find_path_for_last_token)

    set finds (find $find_path -maxdepth 1 -type l)

    for f in $finds
        echo -e "$f\tSymlink" | unexpand-home-tilde | string replace -r '^\./' ''
    end
end
