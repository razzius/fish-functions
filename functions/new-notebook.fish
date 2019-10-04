# Defined in /var/folders/5r/x8hb9kbd5751zn4pz9yq24s80000gn/T//fish.X0ifq9/new-notebook.fish @ line 2
function new-notebook --argument _name
	if any-arguments $argv
    set name $_name
  else
    set name (next_issue)
  end
  set ipynb ~/notebooks/$name.ipynb
  test -e $ipynb || cp ~/notebooks/template.ipynb ~/notebooks/$name.ipynb
  open http://jupyter.local/notebooks/$name.ipynb
end
