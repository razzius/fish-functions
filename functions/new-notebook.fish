function new-notebook --argument _name
    if any-arguments $argv
        set name $_name
    else
        set name (next_issue)
    end
    set ipynb ~/notebooks/$name.ipynb
    test -e $ipynb || cp ~/notebooks/template.ipynb ~/notebooks/$name.ipynb
    open http://jupyter.local/notebooks/$name.ipynb
end
