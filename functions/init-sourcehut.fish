function init-sourcehut
    git remote add origin git@git.sr.ht:~$USER/(curdir | string replace ' ' -)
    and git push origin -o visibility=public --set-upstream
end
