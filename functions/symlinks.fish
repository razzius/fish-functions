function symlinks --argument _path
    set path (default (echo $_path | trim-trailing-slash) .)
    find $path -maxdepth 1 -type l -printf '%f\n'
end
