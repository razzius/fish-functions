function wifi-network-name
    networksetup -getairportnetwork en0 | awk '{print $4}'
end
