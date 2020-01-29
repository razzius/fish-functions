function capitalize
    read text
    set first (echo $text | cut -c 1 | string upper)
    set rest (echo $text | cut -c 2-)
    echo $first$rest
end
