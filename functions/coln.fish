function coln --argument-names number
    awk '{print $'$number'}'
end
