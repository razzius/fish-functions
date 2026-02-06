cd (mkusertemp)

function __cleanup
    if string-empty $DEBUG
        file-exists mylink && unsymlink mylink
        file-exists mydir && rmdir mydir
        remove -f a b c file
        remove -f err.txt expected_err.txt
        remove -rf repo
        remove -f readme.md
        rmdir-.
    end
end

function assert_status --argument-names result expected
    if not equals $result $expected
        error "move should have exited with status $expected but got $result"
        return 1
    end
end

function test_move_handle_1_argument
    move rere 2> err.txt

    assert_status $status 1 || return 1

    echo 'move: given arguments "rere" but expected at least 2 arguments' > expected_err.txt

    if not equals (cat expected_err.txt) (cat err.txt)
        error "move had unexpected stderr:"
        cat err.txt >&2
        error "but expected:"
        cat expected_err.txt >&2
        return 1
    end
end

function test_move_handle_missing_file
    move nofile nowhere 2> err.txt

    assert_status $status 1 || return 1

    echo 'move: `from` argument "nofile" does not exist' > expected_err.txt

    if not equals (cat err.txt) (cat expected_err.txt)
        error move had unexpected stderr
        cat err.txt >&2
        error "but expected:"
        cat expected_err.txt >&2
        return 1
    end
end

function test_move_symlink_error
    mkdir mydir
    symlink mydir mylink

    move mylink/ renamed 2> err.txt < /dev/null

    assert_status $status 1 || return 1

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

    # It shouldn't prompt
    move new.txt to.txt < /dev/null

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
    move a.txt b.txt target/ 2> move_stdout.txt < /dev/null

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
    move a b c 2> expected_err.txt
    set result_status $status

    assert_status $status 1 || return 1

    set expected_err 'move: "c" is not a directory'

    if not equals (cat expected_err.txt) $expected_err
        error "move stderr unexpected: "(cat expected_err.txt)
        error "expected: $expected_err"
        return 1
    end
end

function test_move_file_to_itself
    touch file
    move file file < /dev/null 2> err.txt
    assert_status $status 1 || return 1
end

function test_move_change_capitalization
    echo contents > README.md
    move README.md readme.md < /dev/null 2> err.txt
    if not file-exists readme.md
        error "move didn't rename README.md to readme.md"
        return 1
    end
    set contents (cat readme.md)
    if not equals $contents contents
        error "move didn't rename file properly"
    end
end

function main
    test_move_handle_1_argument
    and test_move_handle_missing_file
    and test_move_symlink_error
    and test_move_no_confirm_committed_file
    and test_move_confirm_mixed_committed_files
    and test_move_error_multiple_file_not_dir
    and test_move_file_to_itself
    and test_move_change_capitalization
end

main
set success $status
__cleanup
return $success
