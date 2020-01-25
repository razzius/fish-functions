# Defined in /var/folders/7v/b0z6dsqj1fx8k5rf8x121l580000gn/T//fish.umzv79/sync-repos.fish @ line 2
function sync-repos
	for repo in ~/.config/fish ~/.spacemacs.d ~/.dotfiles ~/.password-store/
echo $repo
git -C $repo stat
git -C $repo pull
git -C $repo push
echo
end
end
