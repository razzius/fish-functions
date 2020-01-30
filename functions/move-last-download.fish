function move-last-download
    mv ~/Downloads/(ls -t -A ~/Downloads/ | head -1) .
end
