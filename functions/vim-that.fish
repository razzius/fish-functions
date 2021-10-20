function vim-that
    set target (last-thing)
    if file-exists $target
        vim $target
    else
        echo Last word of command was not a file: $target
    end
end
