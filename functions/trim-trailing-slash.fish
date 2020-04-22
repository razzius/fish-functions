# Defined in /var/folders/7v/b0z6dsqj1fx8k5rf8x121l580000gn/T//fish.Qo3rSu/trim-trailing-slash.fish @ line 2
function trim-trailing-slash
    read str
    string replace -r '/$' '' $str
end
