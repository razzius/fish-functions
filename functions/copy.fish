function copy
    # Ignore the -r flag - copy always allows recursive directories
    argparse r -- $argv

    set count (count $argv | tr -d \n)

    set target $argv[$count]

    set froms_source $argv[1..(math $count - 1)]
    set froms_result
    for from in $froms_source
        set trimmed (echo $from | trim-trailing-slash)
        set froms_result $froms_result $trimmed
    end

    if file-committed-in-git $argv[2]
        cp -r $froms_result $target
    else
        cp -r -i $froms_result $target
    end
end
