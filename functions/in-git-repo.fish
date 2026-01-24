function in-git-repo --argument-names _dir
    if equals (curdir) .git
        # I don't consider the .git directory itself to be
        # part of the repo, since you can't run git commands from it.
        return 1
    end

    set dir (default $_dir .)
    git -C $dir rev-parse --git-dir &> /dev/null
end
