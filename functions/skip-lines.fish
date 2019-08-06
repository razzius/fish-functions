# Defined in /var/folders/5r/x8hb9kbd5751zn4pz9yq24s80000gn/T//fish.0i81OA/skip-lines.fish @ line 2
function skip-lines --argument n
    tail +(echo "1 + $n" | bc)
end
