function last-function-name --argument index
	history --prefix func | awk 'NF>1' | row (default $index 1) | replace '-s' '' | coln 2
end
