function mv-last
    mv ~/Downloads/(ls -t -A ~/Downloads/ | head -1) .
end
