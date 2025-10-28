function port-ps --argument port
    sudo lsof -Pi :$port
end
