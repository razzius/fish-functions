# Defined in /var/folders/5r/x8hb9kbd5751zn4pz9yq24s80000gn/T//fish.tUijyN/rg.fish @ line 2
function rg
    if test (count (echo $argv | grep -v '-')) -gt 1 && test ! -e $argv[-1]
        command rg "$argv"
    else
        command rg $argv
    end
end
