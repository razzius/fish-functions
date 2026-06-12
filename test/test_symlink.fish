function __cleanup
    if string-empty $DEBUG
        rm error.txt
        rmdir-.
    end
end

function test_symlink
    # symlink should not allow linking from a nonexistant file
    # If given a nonexistant file, it should exit with status 1 and print a message to stderr
    symlink nonexistant anything 2> error.txt
    set result_status $status

    set expected_status 1

    if not equals $result_status $expected_status
        error "`symlink` status did not match expected."
        error "Expected status $expected_status but got $result_status"
        return 1
    end

    set desired_pattern "symlink: `from` argument '.*' does not exist"
    set output (cat error.txt)

    if not string match -qr $desired_pattern $output
        error "`symlink` status did not match expected."
        error "Expected: $desired_pattern"
        error "Actual: $output"
        return 1
    end
end

function main
    mkdir-cd test_symlink

    run-tap-tests test_symlink

    __cleanup
end

main
