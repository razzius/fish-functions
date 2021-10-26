function sync-repos
  for repo in ~/.config/fish ~/.spacemacs.d ~/.dotfiles ~/.password-store/ ~/.config/karabiner/
    set unexpanded_name (echo $repo | unexpand-tilde-home)
    if dir-exists $repo
      draw-line
      echo Syncing repository $unexpanded_name...
      draw-line
      sync-repo $repo
    else
      echo $unexpanded_name not present
    end
    echo
  end
end
