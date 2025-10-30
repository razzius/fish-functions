function hub --argument _remote
    set remote (default $_remote (git rev-parse --abbrev-ref @{upstream} | cut -d / -f 1))

    set url (git config --get remote.$remote.url)
    set https_url (echo $url | string replace -r 'git@(.+):' 'https://$1/')
    $BROWSER $https_url
end
