function in-git-dir
    git rev-parse --git-dir > /dev/null 2> /dev/null
end
