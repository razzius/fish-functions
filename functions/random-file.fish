function random-file
    find . -type f | shuf -n1
end
