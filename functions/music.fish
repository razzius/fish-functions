function music --argument dir
    for f in $dir/*.{flac,mp3,m4a,wav}
        mplayer -vo null $f || break
    end
end
