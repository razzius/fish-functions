function _move_using_tmp --argument-names flags from to tmp
    # Allows renaming a file case-sensitively on a case-insensitive file system
    mv $flags $from $tmp
    mv $flags $tmp/$from $to
end

function _move_single --argument-names from to tmp
    if not file-exists $from
        error 'move: `from` argument "'$from'" does not exist'
        return 1
    end

    if is-symlink $from && string match --quiet --regex --entire '/$' $from
        error 'move: `from` argument "'$from'" is a symlink with a trailing slash.'
        error 'move: to rename a symlink, remove the trailing slash from the argument.'
        return 1
    end

    if equals $from $to
        error "move: not going to move '$from' to itself"
        return 1
    end

    if file-committed-in-git $to
        _move_using_tmp '--' $from $to $tmp
    else
        _move_using_tmp -i $from $to $tmp
    end
end

function move
    set argc (count $argv)
    if test $argc -lt 2
        error 'move: given arguments "'$argv'" but expected at least 2 arguments'
        return 1
    end

    set froms $argv[1..-2]

    set tmp (mkusertemp)

    if equals (count $argv) 2
        _move_single $argv[1] $argv[2] $tmp
        set result $status
        rmdir $tmp
        return $result
    end

    set target_dir $argv[-1]
    if not is-dir $target_dir
        error 'move: "'$target_dir'" is not a directory'
        return 1
    end

    for f in $froms
        set to $target_dir$f

        _move_single $f $to $tmp

        set result $status

        if not equals $result 0
            rmdir $tmp
            return $result
        end
    end
end
