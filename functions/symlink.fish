function symlink --argument _from _to
    set abs_to (abspath "$_to")

    if test -d $_to && not test -d $_from
        set to "$abs_to/"(basename $_from)
    else
        set to "$abs_to"
    end

    set from (abspath "$_from")

    ln -s $from $to
end
