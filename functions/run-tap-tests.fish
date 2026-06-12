function run-tap-tests
    set count (default $_n_tests 0)
    set start_count $count
    set result 0

    for test in $argv
        set count (math "$count + 1")
        set -U _n_tests $count

        if $test
            echo ok $count - $test
        else
            echo not ok $count - $test
            set result 1
        end
    end

    return $result
end
