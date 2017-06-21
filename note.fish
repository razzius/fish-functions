function note
	if [ "$argv" != '' ]
    echo $argv >> ~/notes.org
  else
    pbpaste >> ~/notes.org
  end
end
