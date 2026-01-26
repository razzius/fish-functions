function endswith --argument-names suffix string
    string match -qr -- "$suffix\$" $string
end
