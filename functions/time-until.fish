function time-until --argument time
    set target (chrono $time -f %s)
    set now (date +%s)
    math $target - $now
end
