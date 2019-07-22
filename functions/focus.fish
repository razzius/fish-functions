# Defined in /var/folders/5r/x8hb9kbd5751zn4pz9yq24s80000gn/T//fish.gCcPpw/focus.fish @ line 2
function focus --argument time
	set objective $argv[2..-1]
	say $objective
	set minutes "$time"m
bash -c "gsleep 1m; say $argv[2..-1]" &
bash -c "gsleep $minutes; osascript -e 'display notification \"done $objective\"'" &
end
