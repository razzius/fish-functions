# Defined in /var/folders/7v/b0z6dsqj1fx8k5rf8x121l580000gn/T//fish.K564F6/unsymlink.fish @ line 2
function unsymlink --argument _file
    set file (echo $_file | trim-trailing-slash)
    test -L $file
    and rm $file
end
