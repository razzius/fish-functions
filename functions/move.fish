function move
    set from $argv[1]

    if is-symlink $from; and string match --quiet --regex --entire '/$' $from
        error 'move: `from` argument "'$from'" is a symlink with a trailing slash.'
        error 'move: to rename a symlink, remove the trailing slash from the argument.'
        return 1
    end

    set destination_files $argv[2]

    if file-committed-in-git $destination_files
        mv $argv
        return $status
    end

    mv -i $argv
end
