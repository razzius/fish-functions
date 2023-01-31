function abbr-add --argument shorthand
	set expansion (echo $argv[2..] | unexpand-home-tilde)
    set abbr_command "abbr -a -- $shorthand \"$expansion\""
	eval "$abbr_command"
	set abbr_file "$HOME/.config/fish/conf.d/abbrs.fish"
	echo "$abbr_command" >> $abbr_file
	sort -o $abbr_file $abbr_file
end
