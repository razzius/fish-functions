function echo-variable --no-scope-shadowing
    for arg in $argv
        eval 'echo -n $'(echo $arg | string upper)
        echo -n " "
    end
    echo
end
