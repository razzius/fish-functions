function init-sourcehut --argument _visibility
    set visibility (default $_visibility public)
    git remote add origin git@git.sr.ht:~$USER/(curdir | string replace ' ' -)
    and git push origin -o visibility=$visibility --set-upstream
end
