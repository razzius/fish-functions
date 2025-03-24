complete -c unsymlink -f
complete -c unsymlink -a '(__unsymlink_complete_args)'

function __unsymlink_complete_args
    set -l previous_token (commandline -x)[-1]
    if equals $previous_token unsymlink
        set base_path ''
    else
        set base_path $previous_token
    end

    if equals $base_path ''
        set find_path .
    else
        set find_path $base_path
    end

    # Make directories end with / to keep exploring them
    find $find_path -mindepth 1 -maxdepth 1 -type d -printf "$base_path%f/\n"

    # Symlinks end in just the symlink name
    find $find_path -mindepth 1 -maxdepth 1 -type l -printf "$base_path%f\n"
end
