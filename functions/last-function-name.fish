# Defined in /var/folders/7v/b0z6dsqj1fx8k5rf8x121l580000gn/T//fish.ulb65x/last-function-name.fish @ line 1
function last-function-name --argument index
	history --prefix func | string replace -- '-s' '' | awk 'NF>1' | row 1 | coln 2
end
