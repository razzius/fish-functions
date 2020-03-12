# Defined in /var/folders/7v/b0z6dsqj1fx8k5rf8x121l580000gn/T//fish.Tmvw2X/song.fish @ line 2
function song
    fd --full-path (echo "$argv" | string replace --all ' ' '.*')".*.(m4a|mp3|flac|wav)" ~/Music/ | sort | read -z songs
    set n_songs (echo -n "$songs" | wc -l | coln 1)
    if test $n_songs -gt 1
        echo more than 1
        echo -n "$songs"
        echo -n "$songs" | while read -l song
            afplay "$song"
        end
    else
        if test -z "$songs"
            echo empty
        else
            afplay (echo $songs | head -1)
        end
    end
end
