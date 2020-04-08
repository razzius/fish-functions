# Defined in /var/folders/7v/b0z6dsqj1fx8k5rf8x121l580000gn/T//fish.j4PcrS/wip.fish @ line 2
function wip
    git add .
    git commit --no-verify -m "wip $argv"
end
