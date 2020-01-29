function clone-cd --argument repo _destination
    set destination (default $destination (basename $repo | trim-right .git))
    hub clone --depth=1 $repo $destination && cd $destination
end
