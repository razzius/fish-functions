function last-download
    ls -t ~/Downloads | read latest_modified
    echo ~/Downloads/$latest_modified
end
