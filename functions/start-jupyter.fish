# Defined in /var/folders/5r/x8hb9kbd5751zn4pz9yq24s80000gn/T//fish.jIvNBi/start-jupyter.fish @ line 2
function start-jupyter
	launchctl start local.jupyter.notebook
  echo "rdr pass inet proto tcp from any to any port 80 -> 127.0.0.1 port 8888" | sudo pfctl -ef - ^ /dev/null
end
