function assert --argument-names value expected
    if equals $value $expected
        echo ok
        return 0
    else
        echo not ok
        return 1
    end
end
