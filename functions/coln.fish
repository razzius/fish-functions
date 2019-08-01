function coln
    while read -l input
        echo $input | awk '{print $'$argv[1]'}'
    end
end
