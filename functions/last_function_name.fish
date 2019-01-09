# Defined in - @ line 2
function last_function_name --argument index
	history --prefix func | awk 'NF>1' | row (default $index 1) | coln 2
end
