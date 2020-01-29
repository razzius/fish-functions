function last-function-name --argument index
    history --prefix func | string replace -- '-s' '' | awk 'NF>1' | row 1 | coln 2
end
