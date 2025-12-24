function eat --argument dir
    # currently only works to the current directory.
    # doesn't work to eat a directory in a different dir
    set files_to_move (find $dir -maxdepth 1 -not -path $dir)

    for f in $files_to_move
        set filename (echo $f | string replace $dir/ '')

        # Handle the special case of a file within a directory named
        # the same as the directory itself. Since the directory will
        # be deleted, it won't collide with the file of the same name.
        if equals $filename $dir
            continue
        end

        if file-exists ./$filename
            error "eat: file would be overwritten: ./$filename"
            return 1
        end
    end

    set target (dirname $dir)

    set tmpdir (mkusertemp)

    for f in $files_to_move
        mv -n $f $tmpdir
    end

    rmdir $dir

    for f in $files_to_move
        # Use the -n flag to not overwrite.
        # This should already be handled by the logic above
        # but I'll also use -n here just to be safe.
        set filename (echo $f | string replace $dir/ '')
        mv -n $tmpdir/$filename $target
    end

    rmdir $tmpdir
end
