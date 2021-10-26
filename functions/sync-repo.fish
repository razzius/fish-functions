function sync-repo --argument repo
    git -C $repo status -sb
    echo 'Pull: '
    git -C $repo pull
    echo 'Push: '
    git -C $repo push
end
