function start-jupyter
    launchctl start local.jupyter.notebook
    echo "rdr pass inet proto tcp from any to any port 80 -> 127.0.0.1 port 8888" | sudo pfctl -ef - ^/dev/null
end
