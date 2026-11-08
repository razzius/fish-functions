function move-last-download --argument-name _destination
    set destination (default $_destination .)
    set file (last-download)
    move $file $destination
end
