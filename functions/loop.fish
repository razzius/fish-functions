function loop --description 'loop <count> <command>'
    for i in (seq 1 $argv[1])
        eval $argv[2..-1]
    end
end
