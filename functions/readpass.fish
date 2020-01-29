function readpass --argument var
    read --silent localvar
    export $var=$localvar
end
