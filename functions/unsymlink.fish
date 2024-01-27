function unsymlink --argument _file
    set file (echo $_file | trim-trailing-slash)
    is-symlink $file and rm $file
    or echo "unsymlink: not a symlink: $file"
end
