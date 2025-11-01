function symlinks --argument _path
    set path (default (echo $_path | trim-right /) .)
    find $path -maxdepth 1 -type l -printf '%f\n'
end
