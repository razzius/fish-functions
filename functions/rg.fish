function rg
    if test (count (echo $argv | sed s/-// | string split ' ')) -gt 1 && test ! -e $argv[-1]
        command rg "$argv"
    else
        command rg $argv
    end
end
