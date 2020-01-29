function sleep-notify --argument time
    bash -c "sleep $time; notify" &
end
