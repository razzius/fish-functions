function save-abbr --argument abbreviation
    set expansion "$argv[2..-1]"
    abbr $abbreviation $expansion
    echo "abbr $abbreviation \"$expansion\"" >>~/.fish_abbrs.fish
end
