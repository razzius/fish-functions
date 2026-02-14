cd (mkusertemp)

function __cleanup
    rmdir-.
end

function test_remove_simple
    touch remove_me.txt
    remove remove_me.txt
    not file-exists remove-me.txt
end

function test_remove_git_repo
    mkdir-cd git_repo
    git init --quiet
    cd ..
    echo y | remove -r git_repo
    not file-exists git_repo
end

function main
    set tests test_remove_simple test_remove_git_repo
    run-tap-tests $tests
end

main
set result $status
__cleanup
return $result
