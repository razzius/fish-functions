# Defined in /var/folders/7v/b0z6dsqj1fx8k5rf8x121l580000gn/T//fish.sobL17/symlink.fish @ line 2
function symlink --argument _from _to
    if string-empty $from; or string-empty _to
        echo "symlink: must provide from and to arguments"
        return 1
    end

    set abs_to (realpath "$_to")

    if test -d $_to && not test -d $_from
        set to "$abs_to/"(basename $_from)
    else
        set to "$abs_to"
    end

    set from (realpath "$_from")

    ln -s $from $to
end
