# Defined in /var/folders/5r/x8hb9kbd5751zn4pz9yq24s80000gn/T//fish.QGkKiK/album.fish @ line 2
function album --argument the_album
	set script (echo "\
    for f in \"$the_album\"*.flac;
      afplay \"\$f\";
    end
    ")
    begin
      fish -c "$script"
    end
end