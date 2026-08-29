function filter-blank-lines
    cat | string match -r '.+'
end
