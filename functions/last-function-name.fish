# Defined in /var/folders/5r/x8hb9kbd5751zn4pz9yq24s80000gn/T//fish.3tFFdX/last-function-name.fish @ line 2
function last-function-name --argument index
	history --prefix func | replace '-s' '' | awk 'NF>1' | row (default $index 1) | coln 2
end
