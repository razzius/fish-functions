function symlinks --argument path
    set path (default (echo $path | trim-right /) .)
    find $path -type l -maxdepth 1
end
