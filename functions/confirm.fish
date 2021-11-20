function confirm
    read -P "$argv> " response
    return contains $response y Y yes YES
end
