# Defined in - @ line 2
function vpn
    sudo wg-quick up ~/.config/wireguard/wg0.conf
end
