function shutdown
    if not string-empty $argv
        command sudo shutdown $argv
    else
        command sudo shutdown -h now
    end
end
