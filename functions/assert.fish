function assert --argument-names actual expected
    if not equals $actual $expected
        error assert: got $actual, expected $expected
        return 1
    end
end
