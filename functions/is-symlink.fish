function is-symlink --argument file
    test -L (echo $file | trim-trailing-slash)
end
