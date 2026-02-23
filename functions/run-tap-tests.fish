function run-tap-tests
    set result 0
    echo TAP version 14
    echo 1..(count $argv)
    for test in $argv
        if $test
            echo ok - $test
        else
            echo not ok - $test
            set result 1
        end
    end
    return $result
end
