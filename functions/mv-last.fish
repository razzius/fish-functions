# Defined in /var/folders/5r/x8hb9kbd5751zn4pz9yq24s80000gn/T//fish.fd4wnn/mv-last.fish @ line 2
function mv-last
	mv ~/Downloads/(ls -t -A ~/Downloads/ | head -1) .
end
