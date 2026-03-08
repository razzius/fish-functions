function endswith --argument-names suffix string
    set suffix_len (echo -n $suffix | char-count)
    set slice (string sub -s -$suffix_len $string)
    equals $slice $suffix
end
