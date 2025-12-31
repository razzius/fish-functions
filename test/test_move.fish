cd (mkusertemp)

function __cleanup
    if string-empty $DEBUG
        file-exists mylink && unsymlink mylink
        file-exists mydir && rmdir mydir
        remove -f err.txt expected_err.txt
        remove -rf repo
        rmdir-.
    end
end

function test_move_symlink_error
    mkdir mydir
    symlink mydir mylink
    move mylink/ renamed 2> err.txt

    set result_status $status
    set expected_status 1

    if not equals $result_status $expected_status
        error "move gave status $result_status but we expected $expected_status"
    end

    echo 'move: `from` argument "mylink/" is a symlink with a trailing slash.
move: to rename a symlink, remove the trailing slash from the argument.' > expected_err.txt

    if not cmp -s err.txt expected_err.txt
        error "move gave unexpected error message:"
        cat err.txt >&2
        return 1
    end
end

function test_move_no_confirm_committed_file
    mkdir-cd repo
    git init --quiet
    echo 'to' > to.txt
    git add to.txt
    git commit --quiet -m 'Commit to.txt so it can be deleted'

    echo 'new' > new.txt

    # n would cancel the prompt, but it shouldn't prompt
    echo n | move new.txt to.txt

    if not equals (cat to.txt) 'new'
        error "move didn't overwrite commited file without prompting"
        cd ..
        return 1
    end

    cd ..
end

function test_move_no_confirm_multiple_committed_files
    error 'todo'
    return 1
end

function main
    test_move_symlink_error
    and test_move_no_confirm_committed_file
    and test_move_no_confirm_multiple_committed_files
end

main
set success $status
__cleanup
return $success
