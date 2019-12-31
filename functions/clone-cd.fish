# Defined in /var/folders/7v/b0z6dsqj1fx8k5rf8x121l580000gn/T//fish.zCIbyk/clone-cd.fish @ line 2
function clone-cd --argument repo _destination
	set destination (default $destination (basename $repo | trim-right .git))
	  hub clone --depth=1 $repo $destination && cd $destination
end
