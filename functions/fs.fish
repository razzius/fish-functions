# Defined in /Users/razzi/.config/fish/functions/fs.fish @ line 1
function fs
    set function_name (last-function-name)
    funcsave $function_name
    echo Saved $function_name
end
