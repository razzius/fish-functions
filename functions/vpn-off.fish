function vpn-off
    wg-quick down ~/.config/wireguard/wg0.conf
end
