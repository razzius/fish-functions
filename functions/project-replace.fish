function project-replace --argument a b extension
    for f in (fd -t file $extension)
        gsed -i "s/$a/$b/g" $f
    end
end
