function vim-call --argument command
    if string-empty $VIM_TERMINAL
        echo not in vim terminal, exiting
        return 1
    end
    echo \x1b]51';["call", "'$command'", ["'$argv[2]'"]]'\x07
end
