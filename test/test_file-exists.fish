function test_file-exists_does_exist
    touch file.txt

    if not file-exists file.txt
        return 1
    end
end

function test_file-exists_doesnt_exist
    if file-exists nonexistant.txt
        return 1
    end
end

function main
    cd (mkusertemp)

    run-tap-tests test_file-exists_does_exist test_file-exists_doesnt_exist

    remove file.txt
    rmdir-.
end

main
