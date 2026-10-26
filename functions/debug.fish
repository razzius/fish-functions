function debug --no-scope-shadowing
    for varname in $argv
        error $varname (eval 'echo $'$varname)
    end
end
