# Defined in /var/folders/7v/b0z6dsqj1fx8k5rf8x121l580000gn/T//fish.d75bUL/ev.fish @ line 2
function ev --no-scope-shadowing
	for arg in $argv
    eval 'echo -n $'(echo $arg | upper)
    echo -n " "
  end
  echo
end
