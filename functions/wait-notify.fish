function wait-notify --argument time
    set seconds (time-until $time)
    bash -c "sleep $seconds; notify" &
end
