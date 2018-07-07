function function_name
	history --prefix func | awk 'NF>1' | head -1 | coln 2
end
