function rename-pwd --argument new_name
    if file-exists ../$new_name
        error rename-pwd: file already exists: ../$new_name
        return 1
    end

    set current (curdir)
    cd ..
    mv $current $new_name
    cd $new_name
end
