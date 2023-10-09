function sync-repos
    if not file-exists ~/.repos.txt
        echo Put the repositories to sync in ~/.repos.txt
        return 1
    end

    for path in (cat ~/.repos.txt | grep -v '^#')
        set repo (echo $path | expand-home-tilde)

        if not dir-exists $repo
            echo $repo not present
            continue
        end

        draw-line
        echo Syncing repository $path...
        draw-line
        sync-repo $repo
        echo
    end
end
