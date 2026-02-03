function trim-right --argument char
    if string-empty $char
        error trim-right: char argument is empty
        return 1
    end
    sed "s|$char\$||"
end
