function docker-launch
    docker run -it (docker build -q .)
end
