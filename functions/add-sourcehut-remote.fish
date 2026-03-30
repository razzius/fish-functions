function add-sourcehut-remote --argument _remote
    set remote (default $_remote origin)
    git remote add $remote git@git.sr.ht:~$USER/(curdir | string replace ' ' -)
end
