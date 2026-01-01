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

function test_move_confirm_mixed_committed_files
    mkdir-cd repo
    mkdir target
    echo 'a' > target/a.txt
    echo 'b' > target/b.txt
    git init --quiet
    git add target/a.txt
    git commit --quiet -m 'Add target/a.txt which would be overwritten'
    echo 'new_a' > a.txt
    echo 'new_b' > b.txt
    echo n | move a.txt b.txt target/ 2> move_stdout.txt

    # target/b.txt should not be overwritten
    if not equals (cat target/b.txt) 'b'
        error 'move should not overwrite target/b.txt which was not tracked in git'
        return 1
    end

    if not equals (cat target/a.txt) 'new_a'
        error 'move should have overwritten target/a.txt since it was committed in git'
        return 1
    end

    if not equals (ls target | line-count) 2
        error 'there should only be 2 files in target/'
        return 1
    end
    cd ..
end

function test_move_error_multiple_file_not_dir
    touch a b c
    move a b c 2> move_stderr.txt
    set result_status $status

    if not equals $result_status 1
        error "move should have exited with status 1 but got $result_status"
        return 1
    end

    if not equals (cat move_stderr.txt) "move: c is not a directory"
        error "move stderr unexpected: "(cat move_stderr.txt)
        return 1
    end
end

function main
    test_move_symlink_error
    and test_move_no_confirm_committed_file
    and test_move_confirm_mixed_committed_files
    and test_move_error_multiple_file_not_dir
end

main
set success $status
__cleanup
return $success
