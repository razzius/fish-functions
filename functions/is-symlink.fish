function is-symlink --argument file --argument extra
    if not string-empty $extra
        echo 'is-symlink: too many arguments' >&2
        return 1
    end
    test -L (echo $file | trim-trailing-slash)
end
