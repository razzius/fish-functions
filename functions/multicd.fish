function multicd
    if test (string length -- $argv[1]) = 2
        echo ..
        return
    end

    echo (string repeat -n (math (string length -- $argv[1]) - 2) ../)..
end
