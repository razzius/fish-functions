function eat --argument dir
    set files_to_move (find $dir -maxdepth 1 -not -path $dir)

    for f in $files_to_move
        set filename (echo $f | string replace $dir '' | trim-left /)
        if file-exists ./$filename
            echo "eat: file would be overwritten: ./$filename"
            return 1
        end
    end

    set target (dirname $dir)

    for f in $files_to_move
        mv $f $target
    end

    rmdir $dir
end
