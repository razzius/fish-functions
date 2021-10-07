function vim-plugin --argument url
    set target (repo-from-url $url)
    git clone $url ~/.vim/pack/vendor/start/$target
end
