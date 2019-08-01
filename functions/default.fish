function default --argument val default
    if set -q val[1]
        echo $val
    else
        echo $default
    end
end
