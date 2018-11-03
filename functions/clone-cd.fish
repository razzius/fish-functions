function clone-cd --argument repo
	hub clone $repo
cd (basename $repo)
end
