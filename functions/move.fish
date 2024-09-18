function move
    set from $argv[1]
    if is-symlink $from; and string match --quiet --regex --entire '/$' $from
        echo move: `from` argument '"'$from'"' is a symlink with a trailing slash.
        echo move: to rename a symlink, remove the trailing slash from the argument.
        return 1
    end
    mv -i $argv
end
