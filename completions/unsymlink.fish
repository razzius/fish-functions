complete -c unsymlink -f
complete -c unsymlink -a '(__unsymlink_complete_args)'

function __unsymlink_complete_args
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

    # Make directories end with / to keep exploring them with further tab completions
    find $find_path -mindepth 1 -maxdepth 1 -type d -printf "$base_path%f/\tDirectory\n"

    # Symlinks end in just the symlink name
    find $find_path -mindepth 1 -maxdepth 1 -type l -printf "$base_path%f\tSymlink\n"
end
