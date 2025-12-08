function wifi-network-name
    set device (networksetup -listallhardwareports | grep 'Wi-Fi' -A 1 | tail -1 | coln 2)
    networksetup -getairportnetwork $device | awk -F ': ' '{print $2}'
end
