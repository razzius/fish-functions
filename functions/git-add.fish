function git-add
    if not string-empty $argv
        if test "$argv" = '...'
            git add ../..
        else
            git add $argv
        end
    else
        git add .
    end
end
