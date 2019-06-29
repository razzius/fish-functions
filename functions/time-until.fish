# Defined in /var/folders/5r/x8hb9kbd5751zn4pz9yq24s80000gn/T//fish.wX4UPZ/time-until.fish @ line 2
function time-until --argument time
	set target (chrono $time -f %s)
  set now (date +%s)
  echo "($target - $now)" | bc
end
