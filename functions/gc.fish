# Defined in /var/folders/7v/b0z6dsqj1fx8k5rf8x121l580000gn/T//fish.6Q3cgM/gc.fish @ line 2
function gc
	if [ -z "$argv" ]
        if test (git new-files | wc -l | tr -d ' ') = 1
            git commit -m "Add "(git staged-files)
        else if test (git deleted-files | wc -l | tr -d ' ') = 1
            git commit -m "Delete "(git deleted-files)
        else if test (git staged-files | wc -l | tr -d ' ') = 1
            git commit -m "Update "(git staged-files)
        else if not git diff --cached --exit-code --quiet
            echo "Add a commit message"
	else
	    echo "Nothing staged"
        end
    else if [ "$argv" = - ]
        echo 'git checkout -'
        git checkout -
    else
        git commit -m (echo $argv)
    end
end
