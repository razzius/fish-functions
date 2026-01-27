cd (mkusertemp)

function __cleanup
    if string-empty $DEBUG
        rm -rf remove_this_dir a.txt err_out.txt samename folder file.txt
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

    set stderr_file err_out.txt
    echo 'data' > remove_this_dir/a.txt

    set contents 'would be overwritten data'
    echo $contents > a.txt

    eat remove_this_dir 2> $stderr_file

    set result_status $status
    set expected_status 1

    if not equals $result_status $expected_status
        error "Expected status $expected_status but got $result_status"
        __fail
    end

    set output (cat a.txt)

    if not equals $contents $output
        error '`eat` did not behave as expected: file should be unchanged'
        __fail
    end

    set error (cat $stderr_file)

    set expected 'eat: file would be overwritten: ./a.txt'
    if not equals $expected $error
        error '`eat` did not write expected error to stderr'
        error "expected: $expected. error: $error"
        __fail
    end
end

function test_eat_directory_with_file_same_name
    mkdir samename
    echo 'contents' > samename/samename
    eat samename

    set result_status $status
    set expected_status 0

    if not equals $result_status $expected_status
        error "test_eat_directory_with_file_same_name expected status $expected_status but got $result_status"
        __fail
    end
end

function test_eat_directory_ending_with_slash
    mkdir folder
    echo contents > folder/file.txt
    eat folder/

    set result_status $status
    set expected_status 0

    if not equals $result_status $expected_status
        error "test_eat_directory_ending_with_slash expected status $expected_status but got $result_status"
        __fail
    end
end

function main
    test_basic_behavior
    test_no_overwrite
    test_eat_directory_with_file_same_name
    test_eat_directory_ending_with_slash
end

main
__cleanup
