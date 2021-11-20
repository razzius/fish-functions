function eat --argument dir
    for f in (find $dir -maxdepth 1 -not -path $dir)
        rsync --archive --delete $f .
        remove -r $f
    end
    rmdir $dir
end
