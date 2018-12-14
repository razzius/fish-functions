function clone-cd --argument repo --argument destination
  if defined desination
    hub clone $repo $destination
    cd $destination
  else 
    hub clone $repo
    cd (basename $repo)
  end
end
