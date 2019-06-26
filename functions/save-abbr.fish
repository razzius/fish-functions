# Defined in /var/folders/5r/x8hb9kbd5751zn4pz9yq24s80000gn/T//fish.4BlqpB/save-abbr.fish @ line 2
function save-abbr --argument abbreviation
	set expansion "$argv[2..-1]"
    abbr $abbreviation $expansion
    echo "abbr $abbreviation \"$expansion\"" >> ~/.fish_abbrs.fish
end
