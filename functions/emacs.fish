# Defined in /var/folders/5r/x8hb9kbd5751zn4pz9yq24s80000gn/T//fish.ML2f4m/emacs.fish @ line 2
function emacs
	if not [ -e $argv ]
        mkdir -p (dirname $argv)
        touch $argv
    end
    open -a /Applications/Emacs.app/ $argv
end
