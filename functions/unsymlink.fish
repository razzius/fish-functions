function unsymlink --argument _file
    set file (echo $_file | trim-trailing-slash)

    if not is-symlink $file
        echo "unsymlink: not a symlink: $file"
        return 1
    end

    # Use unlink because it can't do things like recursive deletes
    unlink $file
end
