function move-last-download
    set destination (default $argv[1] .)
    set file (last-download)
    move $file $destination
end
