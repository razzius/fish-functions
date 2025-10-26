complete -x -c unsymlink -a "(__fish_complete_directories (commandline -ct))"
complete -x -c unsymlink -a "(__unsymlink_complete_symlinks)"

function __unsymlink_complete_symlinks --argument-names comp
    set -l previous_token (commandline -x)[-1]

    ###echo previous token is $previous_token 1>&2
    if equals $previous_token unsymlink
        set base_path ''
    else
        # Anything after the last slash shouldn't be passed to find,
        # so delete non-slashes at the end
        set base_path (echo $previous_token | string replace -r '[^/]+$' '')
    end

    ###echo base_path is $base_path 1>&2

    if equals $base_path ''
        set find_path .
    else
        set find_path $base_path
    end

    ###echo find_path is $find_path 1>&2
    # # Make directories end with / to keep exploring them with further tab completions
    # set result_path "$base_path%f/"

    # # mindepth to skip current directory, maxdepth to only suggest one level of folder at a time
    # find $find_path -mindepth 1 -maxdepth 1 -type d -printf "$result_path\tDirectory\n"
    # set find_path ~/.rgrc

    # Symlinks end in just the symlink name
    # find $find_path -maxdepth 1 -type l -printf "$base_path%f\tSymlink\n"
    # printf "~/.rgrc\tSymlink\n"
    ### find $find_path -maxdepth 1 -type l -printf "$base_path%f\tSymlink\n" 1>&2
    # find $find_path -maxdepth 1 -type l -printf "$base_path%f\tSymlink\n"
    set finds (find $find_path -maxdepth 1 -type l)
    for f in $finds
        echo -e "$f\tSymlink" | unexpand-home-tilde | string replace -r '^\./' ''
    end
end
