function git-add
    if not string-empty $argv
        git add $argv
    else
        git add .
    end
end
