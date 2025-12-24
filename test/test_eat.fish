mkdir-cd test_eat

function __cleanup
    if string-empty $DEBUG
        rm -rf remove_this_dir a.txt err_out.txt
        rmdir-.
    end
end

function __fail
    __cleanup
    return 1
end

function test_basic_behavior
    mkdir remove_this_dir
    set contents 'file contents'

    echo $contents > remove_this_dir/a.txt

    eat remove_this_dir

    set result_status $status
    set expected_status 0

    if not equals $result_status $expected_status
        error "Expected status $expected_status but got $result_status"
        __fail
    end

    set output (cat a.txt)

    if not string match -q $contents $output
        error '`eat` did not behave as expected: file contents didnt match what was expected'
        __fail
    end
end

function test_no_overwrite
    mkdir remove_this_dir

    echo 'data' > remove_this_dir/a.txt

    set contents 'would be overwritten data'
    echo $contents > a.txt

    eat remove_this_dir 2> err_out.txt

    set result_status $status
    set expected_status 1

    if not equals $result_status $expected_status
        error "Expected status $expected_status but got $result_status"
        __fail
    end

    set output (cat a.txt)

    if not string match -q $contents $output
        error '`eat` did not behave as expected: file should be unchanged'
        __fail
    end
end

function main
    test_basic_behavior
    test_no_overwrite
end

main
__cleanup
