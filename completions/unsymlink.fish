complete --keep-order -x -c unsymlink -a "(__fish_complete_directories (commandline -ct))"
complete --keep-order -x -c unsymlink -a "(__unsymlink_complete_symlinks)"

function __unsymlink_complete_symlinks
    set find_path (__completion_find_path_for_last_token unsymlink)

    set finds (find $find_path -maxdepth 1 -type l)

    for f in $finds
        echo -e "$f\tSymlink" | unexpand-home-tilde | string replace -r '^\./' ''
    end
end
