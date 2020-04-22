function songs
    for f in $argv/*.{mp3,flac,m4a}
        afplay $f
    end
end
