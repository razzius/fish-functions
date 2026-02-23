function test_find-and-replace
    cd (mkusertemp)
    mkdir-cd repo

    echo 'original' > file.txt

    find-and-replace 'original' 'updated' txt

    if equals (cat file.txt) 'updated'
        echo ok
    else
        echo not ok
    end

    remove file.txt
    rmdir-.
end

function main
    echo 'TAP version 14'
    echo '1..1'
    test_find-and-replace
end

main
