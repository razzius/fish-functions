function backup
	echo $argv[1] | rev | cut -d / -f 2- | rev | read file
	mv $file $file.bak
end
