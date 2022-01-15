function goto-definition --argument name
    set def (rg -n -H --no-heading 'class '$name'\b')
    set file (echo $def | cut -d : -f 1)
    set line (echo $def | cut -d : -f 2)
    $EDITOR $file +$line
end
