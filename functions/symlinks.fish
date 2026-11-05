function symlinks --argument _path
    set path (default $_path .)
    find $path -maxdepth 1 -type l -exec basename {} \;
end
