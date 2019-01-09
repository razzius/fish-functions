function fs
	set function_name (last_function_name)
  funcsave $function_name
  echo Saved $function_name
end
