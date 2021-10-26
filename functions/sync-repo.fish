function sync-repo --argument repo
    git -C $repo status -sb
    git -C $repo pull
    git -C $repo push
end
