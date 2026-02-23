function find-and-replace --argument-names find replace extension
    if string-empty $extension
        error 'find-and-replace: missing `extension` argument'
        return 1
    end

    set files (
        rg --files-with-matches \
            --type-add "search:*.$extension" \
            --type=search \
            --color=never \
            --multiline \
            -e $find
    )
    for f in $files
        rg $find \
            --passthru \
            --multiline \
            --no-line-number \
            --color=never \
            --replace $replace $f | sponge $f
    end
end
