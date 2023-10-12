function expand-home-tilde
    cat - | string replace '~' $HOME
end
