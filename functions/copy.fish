function copy
    set count (count $argv | tr -d \n)

    if test "$count" = 2
        if test -d "$argv[1]"
            set from (echo $argv[1] | trim-right /)
            set to $argv[2]
            command cp -i -r $from $to
            return
        end

        if file-committed-in-git $argv[2]
            cp $argv
            return
        end
    end

    command cp -i $argv
end
