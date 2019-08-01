function eat --argument dir
    for f in (find $dir -not -path $dir -name '*' -maxdepth 1)
        mv $f .
    end
    rmdir $dir
end
