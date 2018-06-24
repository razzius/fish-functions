function function_name
	history --prefix func | awk 'NF>2' head -1 | coln 2
end
