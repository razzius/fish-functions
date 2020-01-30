function default --argument val default
    if not empty-string $val
        echo "$val"
    else
        echo "$default"
    end
end
