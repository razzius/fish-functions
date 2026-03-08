function test_startswith_simple
    startswith 'a' 'abc'
end

function test_startswith_fails
    not startswith '.' 'abc'
end

function test_startswith_prefix_too_large
    not startswith 'abcd' 'abc'
end

function main
    set tests \
        test_startswith_simple \
        test_startswith_fails \
        test_startswith_prefix_too_large

    run-tap-tests $tests
end

main
