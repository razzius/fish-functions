function sync-repos
    if string-empty SYNC_REPOS
        echo 'Put the repositories to sync in environment variable SYNC_REPOS'
        return 1
    end

    for repo in $SYNC_REPOS
        if not is-dir $repo
            echo $repo not present
            continue
        end

        echo $path
        if not sync-repo $repo
            echo 'sync-repos: canceling'
            return 1
        end
        echo
    end
end
