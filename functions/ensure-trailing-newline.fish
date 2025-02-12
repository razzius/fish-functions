function ensure-trailing-newline --argument file
    if not file-exists $file
        return
    end

    if test -n (tail -c 1 $file)
        echo >> $file
    end
end
