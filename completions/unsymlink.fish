complete -x -c unsymlink -a "(__fish_complete_directories (commandline -ct))"
complete -x -c unsymlink -a "(__unsymlink_complete_symlinks)"

function __unsymlink_complete_symlinks --argument-names comp
    set -l previous_token (commandline -x)[-1]

    if equals $previous_token unsymlink
        set base_path ''
    else
        # Anything after the last slash shouldn't be passed to find,
        # so delete non-slashes at the end
        set base_path (echo $previous_token | string replace -r '[^/]+$' '')
    end

    if equals $base_path ''
        set find_path .
    else
        set find_path $base_path
    end

    # echo findpath is $find_path 1>&2

    set finds (find $find_path -maxdepth 1 -type l)
    for f in $finds
        echo -e "$f\tSymlink" | unexpand-home-tilde | string replace -r '^\./' ''
    end
end
