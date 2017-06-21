function fs
	set function_name (history --prefix func | head -1 | coln 2)
  funcsave $function_name
  echo Saved $function_name
end
