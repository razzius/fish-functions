function eat --argument dir
    set files_to_move (find $dir -maxdepth 1 -not -path $dir)

    for f in $files_to_move
        set filename (echo $f | string replace "$dir/" '' )
        if file-exists ./$filename
            error "eat: file would be overwritten: ./$filename"
            return 1
        end
    end

    set target (dirname $dir)

    for f in $files_to_move
        # Use the -n flag to not overwrite.
        # This should already be handled by the logic above
        # but I'll also use -n here just to be safe.
        mv -n $f $target
    end

    rmdir $dir
end
