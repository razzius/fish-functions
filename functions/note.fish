# Defined in /var/folders/7v/b0z6dsqj1fx8k5rf8x121l580000gn/T//fish.GDSmDq/note.fish @ line 2
function note
	if [ "$argv" != '' ]
    echo $argv >> ~/notes.org
  else
    pbpaste >> ~/notes.org
    echo >> ~/notes.org
  end
end
