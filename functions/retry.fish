function retry
    while true
        eval $argv && break
        sleep 1
    end
end
