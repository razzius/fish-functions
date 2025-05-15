function symlink --argument-names _from --argument-names _to
    if string-empty $_from; or string-empty $_to
        echo "symlink: must provide from and to arguments"
        return 1
    end
    set target (basename $_to)
    set abs_to (realpath (dirname "$_to"))/$target || return 1

    if test -d $_to && not test -d $_from
        set to "$abs_to/"(basename $_from)
    else
        set to "$abs_to"
    end

    set from (realpath $_from 2> /dev/null)

    if string-empty $from || not test -e $from
        echo "symlink: `from` argument '$_from' does not exist" >&2
        return 1
    end

    ln -s $from $to
end
