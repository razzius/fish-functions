# Defined in /var/folders/7v/b0z6dsqj1fx8k5rf8x121l580000gn/T//fish.cpElu9/md.fish @ line 2
function md --argument file
    pandoc --from gfm --to html $file >/tmp/md.html
    open /tmp/md.html
end
