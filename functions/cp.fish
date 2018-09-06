# Defined in /var/folders/7v/b0z6dsqj1fx8k5rf8x121l580000gn/T//fish.xE4lyi/cp.fish @ line 2
function cp
	set count (count $argv | tr -d \n)
	if [ (count $argv | tr -d \n) = 2 ]; and [ -d $argv[1] ]
    command cp -r $argv
  else if [ $count = 1 ]
    cp (echo $argv | trim-right /) .
  else
    command cp $argv
  end
end
