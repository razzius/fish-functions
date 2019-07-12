# Defined in /var/folders/5r/x8hb9kbd5751zn4pz9yq24s80000gn/T//fish.oVYofy/song.fish @ line 2
function song
	afplay **/*(echo $argv | title-case)*.flac
end
