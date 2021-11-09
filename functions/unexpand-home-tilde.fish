function unexpand-home-tilde
    cat - | string replace $HOME '~'
end
