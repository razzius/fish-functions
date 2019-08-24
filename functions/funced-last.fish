# Defined in /var/folders/5r/x8hb9kbd5751zn4pz9yq24s80000gn/T//fish.3Ddr5f/funced-last.fish @ line 2
function funced-last
    set function_name (last-function-name)
    funced $function_name
    funcsave $function_name
end
