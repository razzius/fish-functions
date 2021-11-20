function confirm
    read -P "$argv> " response
    contains $response y Y yes YES
end
