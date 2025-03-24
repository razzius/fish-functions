# symlink should not allow linking from a nonexistant file
# If given a nonexistant file, it should exit with status 1 and print a message to stderr

mkdir-cd test_symlink

function __cleanup
    if string-empty $DEBUG
        rm error.txt
        rmdir-.
    end
end

symlink nonexistant anything 2> error.txt
set result_status $status

set expected_status 1

if not equals $result_status $expected_status
    echo `symlink` status did not match expected.
    echo Expected status $expected_status but got $result_status
    __cleanup
    return 1
end

set desired_pattern "symlink: `from` argument '.*' does not exist"
set output (cat error.txt)

if not string match -qr $desired_pattern $output
    echo `symlink` output did not match expected.
    echo Expected: $desired_pattern
    echo Actual: $output
    __cleanup
    return 1
end

__cleanup
