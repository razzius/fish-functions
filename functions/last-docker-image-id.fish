function last-docker-image-id
    docker ps -l --no-trunc --format '{{.Image}}'
end
