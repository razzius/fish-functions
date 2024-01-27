function git-add
    if not string-empty $argv
        # TODO `...` could be replaced with ../.. as abbr
        if test "$argv" = '...'
            git add ../..
        else
            git add $argv
        end
    else
        git add .
    end
end
