function echo-variable --no-scope-shadowing
    if string-empty $argv
        return 1
    end
    if set -q -- $argv
        set varname $argv
    else
        set varname (echo $argv | string upper)
    end
    eval 'echo $'$varname
end
