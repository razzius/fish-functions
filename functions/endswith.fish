function endswith --argument-names suffix string
    set suffix_len (echo -n $suffix | char-count)
    if test $suffix_len -gt (echo -n $string | char-count)
        return 1
    end

    set slice (string sub -s -$suffix_len $string)
    equals $slice $suffix
end
