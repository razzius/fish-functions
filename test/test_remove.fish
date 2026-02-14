cd (mkusertemp)

function __cleanup
    rmdir-.
end

function test_1
    assert 1 1
end

function test_2
    assert 1 2
end

function main
    set tests test_1 test_2
    run-tap-tests $tests
end

main
set result $status
__cleanup
return $result
