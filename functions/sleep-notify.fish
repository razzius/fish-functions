# Defined in /var/folders/5r/x8hb9kbd5751zn4pz9yq24s80000gn/T//fish.7h4Taq/sleep-notify.fish @ line 1
function sleep-notify --argument time
	bash -c "sleep $time; notify" &
end
