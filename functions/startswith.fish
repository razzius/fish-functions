function startswith --argument prefix string
    string match -qr "^$prefix" $string
end
