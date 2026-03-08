function startswith --argument prefix string
    set prefix_len (echo -n $prefix | char-count)
    set slice (string sub -l $prefix_len $string)
    equals $slice $prefix
end
