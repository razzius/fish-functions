function ensure-trailing-newline --argument file
    if not file-exists $file
        return 1
    end

    if not equals (tail -c 1 $file | line-count) 1
        echo >> $file
    end
end
