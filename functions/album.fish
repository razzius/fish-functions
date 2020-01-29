function album --argument the_album
	set script (echo "\
    for f in \"$the_album\"*.{flac,mp3,m4a};
      afplay \"\$f\";
    end
    ")
    begin
        fish -c "$script"
    end
end
