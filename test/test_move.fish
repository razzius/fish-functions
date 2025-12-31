cd (mkusertemp)

function __cleanup
    if string-empty $DEBUG
        unsymlink mylink
        rmdir mydir
        rm err.txt expected_err.txt
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

function main
    test_move_symlink_error
end

main
__cleanup
