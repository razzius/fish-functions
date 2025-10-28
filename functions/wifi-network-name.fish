function wifi-network-name
    set device (networksetup -listallhardwareports | grep 'Wi-Fi' -A 1 | tail -1 | coln 2)
    networksetup -listpreferredwirelessnetworks $device | row 2 | string trim
end
