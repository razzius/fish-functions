function sync-repos
    for repo in ~/.config/fish ~/.spacemacs.d ~/.dotfiles ~/.password-store/
        echo $repo
        git -C $repo stat
        git -C $repo pull
        git -C $repo push
        echo
    end
end
