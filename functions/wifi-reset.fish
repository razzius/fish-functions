function wifi-reset
    networksetup -setairportpower en0 off
    networksetup -setairportpower en0 on
end
