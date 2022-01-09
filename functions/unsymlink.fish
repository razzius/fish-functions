function unsymlink --argument _file
    set file (echo $_file | trim-trailing-slash)
    test -L $file
    and rm $file; or echo unsymlink: not a symlink: $file
end
