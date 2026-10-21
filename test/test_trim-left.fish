function __cleanup
    rmdir-.
end

function __fail
    error $argv
    __cleanup
    return 1
end

function test_trim-left
    set result (echo 'abc' | trim-left 'a')
    if not equals $result 'bc'
        __fail "trim-left a abc did not equal bc, got $result"
    end
end

function test_trim-left-regex
    set result (echo './bc' | trim-left './')
    if not equals $result 'bc'
        __fail "trim-left ./ ./bc did not equal bc, got $result"
    end
end

function main
    mkdir-cd (mkusertemp)

    run-tap-tests test_trim-left \
        test_trim-left-regex

    __cleanup
end

main
