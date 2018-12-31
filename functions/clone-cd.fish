function clone-cd --argument repo --argument destination
  if defined destination
    hub clone $repo $destination
    cd $destination
  else
    hub clone $repo
    cd (basename $repo | trim-right .git)
  end
end
