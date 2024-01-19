function sync-repo --argument repo
    git -C "$repo" status -sb
    git -C "$repo" pull
    if test (git rev-list --count @{upstream}..HEAD) -gt 0
        git -C "$repo" push
    end
end
