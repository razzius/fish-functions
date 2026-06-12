function test_find-and-replace
    mkdir-cd repo

    echo 'original' > file.txt

    find-and-replace 'original' 'updated' txt
    equals (cat file.txt) 'updated'
end

function main
    cd (mkusertemp)

    run-tap-tests test_find-and-replace

    remove file.txt
    rmdir-.
end

main
