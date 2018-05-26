function gcr
	set ref (git current | cut -d / -f 2 | tr '[:lower:]' '[:upper:]')
    git commit -m "[$ref] $argv"
end
