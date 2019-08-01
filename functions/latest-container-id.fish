function latest-container-id
    docker ps -a --no-trunc -q | head -1
end
