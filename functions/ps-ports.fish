function ps-ports --argument-names pid
    sudo lsof -i4 -i6 -a -P -p $pid
end
