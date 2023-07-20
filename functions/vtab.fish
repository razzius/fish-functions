function vtab --argument file
    echo \x1b]51';["call", "Tapi_Tabedit", ["'$file'"]]'\x07
end
