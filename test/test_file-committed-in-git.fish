cd (mkusertemp)
mkdir-cd test_file-committed-in-git

function __cleanup
    rm -fr .git
    rm -f file.txt
end

function __success
    __cleanup
end

function __fail
    __cleanup
    return 1
end

function test_not_in_git_dir
    # a file not in a git dir isn't committed in git
    touch file.txt
    if file-committed-in-git file.txt
        error 'fail: file.txt is not in git dir and should not be file-committed-in-git'
        __fail
        return
    end
    __success
end

function test_untracked_file
    # a file that isn't added to git is not committed in git
    git init --quiet
    touch file.txt
    if file-committed-in-git file.txt
        error 'fail: file.txt is not tracked in git and should not be file-committed-in-git'
        __fail
        return
    end
    __success
end

function test_staged_file_not_committed
    # a file that is staged is not committed in git
    git init --quiet
    touch file.txt
    git add file.txt
    if file-committed-in-git file.txt
        error 'fail: file.txt is staged and should not be file-committed-in-git'
        __fail
        return
    end
    __success
end

function test_file_committed
    git init --quiet
    touch file.txt
    git add file.txt
    git commit --quiet -m 'File now committed'
    if not file-committed-in-git file.txt
        error 'fail: file.txt is committed and should be file-committed-in-git'
        __fail
        return
    end
    __success
end

function main
    test_not_in_git_dir
    test_untracked_file
    test_staged_file_not_committed
    test_file_committed
end

main
rmdir-.
