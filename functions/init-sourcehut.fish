function init-sourcehut --argument _visibility
    set visibility (default $_visibility private)
    add-sourcehut-remote
    and git push origin -o visibility=$visibility --set-upstream
end
