# Defined in /var/folders/z3/fqqzlgpd3kqf2xk3hq1c4n8h0000gn/T//fish.MM5DAv/shutdown.fish @ line 2
function shutdown
    if any-arguments $argv
        command sudo shutdown $argv
    else
        command sudo shutdown -h now
    end
end
