function tun --argument host port
ssh -NL $port:$host:$port $host
end
