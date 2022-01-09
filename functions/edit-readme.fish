function edit-readme
    set root (git root)
    for option in $root/README.md $root/README
        if file-exists $option
            $EDITOR $option
            return
        end
    end
    echo No README.md / README found
    return 1
end
