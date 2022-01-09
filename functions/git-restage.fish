function git-restage
    git add (git diff --name-only --cached)
end
