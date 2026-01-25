function debug --argument-names varname --no-scope-shadowing
    error $varname (eval 'echo $'$varname)
end
