function vtab --argument file
    echo \x1b]51';["call", "Tapi_TabEdit", ["'$file'"]]'\x07
end
