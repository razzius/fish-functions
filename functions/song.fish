# Defined in /var/folders/5r/x8hb9kbd5751zn4pz9yq24s80000gn/T//fish.khoL2P/song.fish @ line 2
function song
	trap "kill %1" SIGINT
	fd (echo "$argv" | replace ' ' '.*') ~/Music/ | read -z songs
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
