function git-restore
    if not string-empty $argv
        git restore $argv
    else
        git restore .
    end
end
