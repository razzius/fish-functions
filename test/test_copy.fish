mkdir-cd test_copy

function __cleanup
    if string-empty $DEBUG
        rm a.txt b.txt error.txt
        rmdir-.
    end
end

function __fail
    __cleanup
    return 1
end

function test_basic_behavior
    set contents 'contents a'

    echo $contents > a.txt

    copy a.txt b.txt 2> error.txt

    set result_status $status
    set expected_status 0

    if not equals $result_status $expected_status
        echo Expected status $expected_status but got $result_status
        __fail
    end

    set output (cat b.txt)

    if not string match -q $contents $output
        echo `copy` did not behave as expected.
        __fail
    end

end

function test_to_multiple_directory_levels
    mkdir from_dir

    echo 'contents' > from_dir/file.txt

    mkdir -p dir1/dir2

    copy from_dir/ dir1/dir2/

    rm dir1/dir2/from_dir/file.txt
    rmdir dir1/dir2/from_dir
    rmdir dir1/dir2
    rmdir dir1
    rm from_dir/file.txt
    rmdir from_dir
end

function main
    test_basic_behavior
    test_to_multiple_directory_levels
end

main
__cleanup
