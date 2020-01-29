function shutdown
    if any-arguments $argv
        command sudo shutdown $argv
    else
        command sudo shutdown -h now
    end
end
