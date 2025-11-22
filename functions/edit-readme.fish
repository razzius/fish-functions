function edit-readme
    set root (git root)
    for file in $root/README.md $root/README
        if file-exists $file
            $EDITOR $file
            return
        end
    end
    echo No README.md / README found
    return 1
end
