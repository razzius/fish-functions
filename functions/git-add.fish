function git-add
    if any-arguments $argv
        git add $argv
    else
        git add .
    end
end
