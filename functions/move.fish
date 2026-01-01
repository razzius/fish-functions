function _move_single --argument-names from to
    if is-symlink $from; and string match --quiet --regex --entire '/$' $from
        error 'move: `from` argument "'$from'" is a symlink with a trailing slash.'
        error 'move: to rename a symlink, remove the trailing slash from the argument.'
        return 1
    end

    if file-committed-in-git $to
        mv $from $to
    else
        mv -i $from $to
    end
end

function move
    set froms $argv[1..-2]

    if equals (count $argv) 2
        _move_single $argv
        return $status
    end

    set target $argv[-1]
    if not is-dir $target
        error "move: $target is not a directory"
        return 1
    end

    for f in $froms
        set to $target$f

        _move_single $f $to
    end
end
