function find-and-replace --argument-names find replace extension
    set files (
        rg \
            --files-with-matches \
            --type-add "search:*.$extension" \
            --type=search \
            --color=never \
            -e $find
    )
    for f in $files
        cat $f | string replace --all -- $find $replace | sponge $f
    end
end
