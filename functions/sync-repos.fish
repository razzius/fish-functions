function sync-repos
    if not file-exists ~/.repos.txt
        echo 'Put the repositories to sync in ~/.repos.txt'
        return 1
    end
    
    for path in (cat ~/.repos.txt | grep -v '^#')
        set repo (echo $path | expand-home-tilde)
        
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
