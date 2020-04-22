# Defined in /var/folders/7v/b0z6dsqj1fx8k5rf8x121l580000gn/T//fish.egdHMw/ec.fish @ line 2
function ec
    touch $argv
    emacsclient -n $argv ^/dev/null
    if test $status = 1
        open -a /Applications/Emacs.app/ -- $argv
    end
end
