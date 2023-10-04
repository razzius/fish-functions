function vim-plugin --argument url
    set target (repo-from-url $url)
    git clone --depth=1 $url ~/.vim/pack/vendor/opt/$target
    and vim -c ":helptags ALL | q"
end
