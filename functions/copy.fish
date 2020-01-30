function copy
    set count (count $argv | tr -d \n)
    if [ $count = 2 ] and [ -d $argv[1] ]
        command cp -r $argv
    else if [ $count = 1 ]
        cp (echo $argv | trim-right /) .
    else
        command cp $argv
    end
end
