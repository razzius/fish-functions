function run-tap-tests
    set result 0
    echo TAP version 14
    echo 1..(count $argv)
    for test in $argv
        $test || set result 1
    end
    return $result
end
