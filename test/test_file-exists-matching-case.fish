function test_file-exists_case_sensitive
    touch file.txt

    if file-exists-matching-case FILE.txt
        error file-exists should be case-sensitive
        return 1
    end
end

function test_file-exists_current_directory
    mkdir another
    touch another/file.txt

    if not file-exists-matching-case file.txt
        error file-exists should look in the current directory only
        return 1
    end

    rm -r another
    rm file.txt
end

function main
    mkdir-cd (mkusertemp)

    set tests \
        test_file-exists_case_sensitive \
        test_file-exists_current_directory

    run-tap-tests $tests

    rmdir-.
end

main
