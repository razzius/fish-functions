function assert --argument-names actual expected
    if string-empty $expected
        error assert: got only 1 argument $actual
        return 1
    end

    if not equals $actual $expected
        error assert: got $actual, expected $expected
        return 1
    end
end
