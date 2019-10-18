# Defined in /var/folders/7v/b0z6dsqj1fx8k5rf8x121l580000gn/T//fish.Uhljhj/rg.fish @ line 2
function rg
	if test (count (echo $argv | sed s/-// | string split ' ')) -gt 1 && test ! -e $argv[-1]
    command rg "$argv"
  else
    command rg $argv
  end
end
