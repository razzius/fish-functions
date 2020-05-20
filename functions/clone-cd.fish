# Defined in /var/folders/7v/b0z6dsqj1fx8k5rf8x121l580000gn/T//fish.U1S8Ro/clone-cd.fish @ line 2
function clone-cd --argument repo _destination
    set destination (default $_destination (basename $repo | trim-right .git))
    if file-exists $destination
      cd $destination && git pull
      return
    end

    git clone --depth=1 $repo $destination && cd $destination
end
