function add-sourcehut-remote
    git remote add origin git@git.sr.ht:~$USER/(curdir | string replace ' ' -)
end
