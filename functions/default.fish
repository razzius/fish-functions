function default --argument val default
    if not string-empty $val
        echo $val
    else
        echo $default
    end
end
