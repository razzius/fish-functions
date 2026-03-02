function git-pull --argument-names remote branch
    if string-empty $remote
        git pull
        return $status
    end

    if string-empty $branch
        git pull $remote (git branch --show-current)
        return $status
    end

    git pull $remote $branch
end
