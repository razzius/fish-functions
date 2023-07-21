function ved
    if string-empty $VIM_TERMINAL
        vim $argv
    else
        vim-call Tapi_TerminalEdit $argv
    end
end
