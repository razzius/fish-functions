function fish_prompt --description 'Write out the prompt'
    set -l last_status $status

    # if set -q VIRTUAL_ENV
    #   echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
    # end

    if not set -q __fish_prompt_normal
        set -g __fish_prompt_normal (set_color normal)
    end

    # PWD
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color normal


    printf ' %s' (date "+%H:%M")

    printf '%s ' (__fish_git_prompt)

    if not test $last_status -eq 0
        set_color $fish_color_error
    end

    if jobs -q
        echo -s -n (set_color -b purple) '.' (set_color normal)
    end

    if set -q VIRTUAL_ENV
        echo -s -n (set_color -b blue) '$' (set_color normal)
    else
        echo -s -n '$'
    end
    echo -n ' '
    set_color normal
end
