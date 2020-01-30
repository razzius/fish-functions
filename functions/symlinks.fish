function symlinks --argument _path
    set path (default (echo $_path | trim-right /) .)
    find $path -type l -maxdepth 1
end
