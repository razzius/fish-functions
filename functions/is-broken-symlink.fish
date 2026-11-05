function is-broken-symlink --argument-names file
    if not is-symlink $file
        error is-broken-symlink: not a symlink: $file
    end

    set target (resolve-symlink $file)

    if file-exists $target
        return 1
    end
end
