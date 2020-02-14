# Defined in /var/folders/7v/b0z6dsqj1fx8k5rf8x121l580000gn/T//fish.3wOdoI/copy.fish @ line 1
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
        command cp -r $argv
    else if test "$count" = 1
        cp (echo $argv | trim-right /) .
    else
        command cp $argv
    end
end
