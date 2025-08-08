function wifi-network-name
    set device (networksetup -listallhardwareports | grep 'Wi-Fi' -A 1 | tail -1 | coln 2)
    ipconfig getsummary $device | grep '  SSID :' | coln 3
end
