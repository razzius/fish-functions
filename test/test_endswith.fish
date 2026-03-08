function test_endswith_simple
    endswith 'c' 'abc'
end

function test_endswith_fails
    not endswith '.' 'abc'
end

function test_endswith_suffix_too_large
    not endswith 'abcd' 'abc'
end

function main
    set tests \
        test_endswith_simple \
        test_endswith_fails \
        test_endswith_suffix_too_large

    run-tap-tests $tests
end

main
