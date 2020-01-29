function focus --argument time
    set objective $argv[2..-1]
    say $objective
    set minutes "$time"m
    bash -c "gsleep 1m; say $argv[2..-1]" &
    bash -c "gsleep $minutes; osascript -e 'display notification \"done $objective\"'" &
end
