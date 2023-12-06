function gitignore --argument pattern
    set gitignore_file (git root)/.gitignore
    ensure-trailing-newline $gitignore_file
    echo $pattern >> $gitignore_file
end
