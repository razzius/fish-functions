function ensure-trailing-newline --argument file
    if test -n (tail -c 1 $file)
        echo >> $file
    end
end
