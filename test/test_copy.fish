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

__cleanup
