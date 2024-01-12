function url-size --description 'Print the human readable size of a URL.' --argument url
    curl -s -I $url | grep -i content-length | tr -d '\r' | coln 2 | numfmt --to=iec
end
