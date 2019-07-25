# Defined in /var/folders/5r/x8hb9kbd5751zn4pz9yq24s80000gn/T//fish.QfyLgO/gc.fish @ line 2
function gc
	if [ -z "$argv" ]
    if test (git new-files | wc -l | tr -d ' ') = 1
      git commit -m "Add "(git staged-files)
    else if test (git staged-files | wc -l | tr -d ' ') = 1
      git commit -m "Update "(git staged-files)
    else
      echo "Add a commit message"
    end
	else if [ "$argv" = - ]
    echo 'git checkout -'
		git checkout -
	else
		git commit -m (echo $argv | capitalize)
	end
end
