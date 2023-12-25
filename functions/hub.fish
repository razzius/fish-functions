function hub
    set url (git config --get remote.origin.url)
    set https_url (echo $url | string replace -r 'git@(.+):' 'https://$1/')
    $BROWSER $https_url
end
