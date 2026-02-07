for f in functions/*.fish
    if not grep -q "$f" README.md
        echo missing doc $f
    end
end
