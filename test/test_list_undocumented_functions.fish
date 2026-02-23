for f in functions/*.fish
    # Functions starting with '_' are considered internal
    if not startswith functions/_ $f && not grep -q "$f" README.md
        echo missing doc $f
    end
end
