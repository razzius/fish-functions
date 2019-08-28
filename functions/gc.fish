function gc
    if [ -z "$argv" ]
        if test (git new-files | wc -l | tr -d ' ') = 1
            git commit -m "Add "(git staged-files)
        else if test (git deleted-files | wc -l | tr -d ' ') = 1
            git commit -m "Delete "(git deleted-files)
        else if test (git staged-files | wc -l | tr -d ' ') = 1
            git commit -m "Update "(git staged-files)
        else
            echo "Add a commit message"
        end
    else if [ "$argv" = - ]
        echo 'git checkout -'
        git checkout -
    else
        git commit -m (echo $argv | capitalize)
    end
end
