function song
    fd --follow --full-path '.*'(echo "$argv" | string replace --all ' ' '.*')".*.(m4a|mp3|flac|wav)" ~/Music/ | sort | read -z songs
    set n_songs (echo -n "$songs" | wc -l | coln 1)
    if test $n_songs -gt 1
        echo more than 1
        echo -n "$songs"
        echo -n "$songs" | while read -l song
            play "$song"
        end
    else
        if test -z "$songs"
            echo empty
        else
            play (echo $songs | head -1)
        end
    end
end
