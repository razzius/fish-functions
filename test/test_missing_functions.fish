set readme (git root)/README.md
set fns (cat $readme | grep '(source)' | coln 1 | string trim -c `)

for f in $fns
    if not file-exists functions/$f.fish
        error "Missing function $f that was described in README"
    end
end
