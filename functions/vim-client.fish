function vim-client --argument file
    if string-empty $VIM_TERMINAL
        echo not in vim terminal
        return 1
    end

    echo -e "\033]51;[\"drop\", \"$file\"]\007"
end
