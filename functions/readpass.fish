function readpass
    stty -echo
    head -n 1 | read -x $argv[1]
    stty echo
end
