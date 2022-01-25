function goto-definition --argument symbol
    set def (rg --type-not h --line-number --no-heading --multiline '(int|def|class)\s+'$symbol | tail -1)
    set file (echo $def | cut -d : -f 1)
    set line (echo $def | cut -d : -f 2)
    $EDITOR $file +$line
end
