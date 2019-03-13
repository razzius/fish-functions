# Defined in /var/folders/7v/b0z6dsqj1fx8k5rf8x121l580000gn/T//fish.8v7STj/emacs.fish @ line 2
function emacs
	if not [ -e $argv ]
    mkdir -p (dirname $argv)
    touch $argv
  end
	open -a /Applications/Emacs.app/ $argv
end
