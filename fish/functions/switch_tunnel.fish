function switch_tunnel
    if test -f /etc/nflx/vpn-full-tunnel
        sudo mv /etc/nflx/vpn-full-tunnel /etc/nflx/vpn-split-tunnel
    else if test -f /etc/nflx/vpn-split-tunnel
        sudo mv /etc/nflx/vpn-split-tunnel /etc/nflx/vpn-full-tunnel
    else
        sudo touch /etc/nflx/vpn-full-tunnel
    end

    find /etc/nflx -name vpn\*tunnel
end
