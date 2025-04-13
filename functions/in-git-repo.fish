function in-git-repo
    equals (git rev-parse --git-dir 2> /dev/null) true
end
