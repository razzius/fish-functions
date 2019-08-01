function domain --argument url
    echo $url | cut -d '/' -f 3
end
