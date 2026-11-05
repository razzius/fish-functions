function resolve-symlink --argument-names file
    if not is-symlink $file
        error resolve-symlink: not a symlink: $file
    end
    readlink -f $file
end
