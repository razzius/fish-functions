function port-ps --argument port
sudo lsof -i :$port
end
