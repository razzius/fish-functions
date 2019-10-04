# Defined in /var/folders/5r/x8hb9kbd5751zn4pz9yq24s80000gn/T//fish.tmlOjt/clone-cd.fish @ line 2
function clone-cd --argument repo destination
	hub clone --depth=1 $repo $destination
    if defined destination
        cd $destination
    else
        cd (basename $repo | trim-right .git)
    end
end
