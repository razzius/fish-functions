function ec
	emacsclient -n $argv ^/dev/null
    if test $status = 1
        open -a /Applications/Emacs.app/ -- $argv
    end
end
