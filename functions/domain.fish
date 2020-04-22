# Defined in /var/folders/7v/b0z6dsqj1fx8k5rf8x121l580000gn/T//fish.twuUHC/domain.fish @ line 2
function domain
    read url
    echo $url | cut -d '/' -f 3
end
