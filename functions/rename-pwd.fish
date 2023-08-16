function rename-pwd --argument new_name
    set current (basename $PWD)
    cd ..
    mv -n $current $new_name
    cd $new_name
end
