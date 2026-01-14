function is-symlink --argument file --argument extra
    if not string-empty $extra
        error 'is-symlink: too many arguments'
        return 1
    end

    test -L (echo $file | trim-trailing-slash)
end
