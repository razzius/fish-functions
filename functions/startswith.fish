function startswith --argument prefix string
    set prefix_len (echo -n $prefix | char-count)

    if test (echo -n $string | char-count) -lt $prefix_len
        return 1
    end

    set slice (string sub -l $prefix_len $string)
    equals $slice $prefix
end
