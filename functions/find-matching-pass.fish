function find-matching-pass --argument-names query
    set matches (find ~/.password-store -maxdepth 1 -type f -iname "*$query*")
    if test (count $matches) -gt 1
        error "find-matching-pass: more than 1: $matches"
        return 1
    end

    echo $matches
end
