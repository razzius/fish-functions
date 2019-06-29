# Defined in /var/folders/5r/x8hb9kbd5751zn4pz9yq24s80000gn/T//fish.LCY1j4/wait-notify.fish @ line 2
function wait-notify --argument time
	set seconds (time-until $time)
	bash -c "sleep $seconds; notify" &
end
