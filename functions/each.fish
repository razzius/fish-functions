function each --argument-names program
    for arg in $argv[2..]
        $program $arg
    end
end
