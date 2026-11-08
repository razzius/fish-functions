function git-push --argument-names _remote _branch
    set remote (default $_remote origin)
    set branch (default $_branch (git branch --show-current))
    git push $remote $branch
end
