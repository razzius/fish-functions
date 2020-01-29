function funcsave-last
    set function_name (last-function-name)
    funcsave $function_name
    echo Saved $function_name
end
