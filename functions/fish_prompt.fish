function fish_prompt --description 'Write out the prompt'
    set -l last_status $status

    if not test $PWD = $HOME
        set_color $fish_color_cwd
        echo -n (basename $PWD)' '
        set_color normal
    end

    if in-git-repo
        set stashes (git stash list | line-count)
        if test $stashes -gt 0
            printf '%s ' $stashes
        end
    end

    if jobs -q
        echo -s -n (set_color -b purple) '.' (set_color normal)
    end

    if not test $last_status -eq 0
        set_color $fish_color_error
    end

    if set -q VIRTUAL_ENV
        echo -s -n (set_color -b blue) '$' (set_color normal)
    else
        echo -s -n '$'
        set_color normal
    end

    echo -n ' '
end
