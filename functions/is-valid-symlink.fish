function is-valid-symlink --argument-names file
    if not is-symlink $file
        error is-valid-symlink: not a symlink: $file
        return 1
    end

    set target (resolve-symlink $file)

    file-exists $target
end
