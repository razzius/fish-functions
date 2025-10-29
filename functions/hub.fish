function hub --argument _remote
    set remote (default $_remote origin)

    set url (git config --get remote.$remote.url)
    set https_url (echo $url | string replace -r 'git@(.+):' 'https://$1/')
    $BROWSER $https_url
end
