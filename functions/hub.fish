function hub --argument _remote
    if string-empty $_remote
        set remote (git rev-parse --abbrev-ref @{upstream} | cut -d / -f 1)
    else
        set remote $_remote
    end

    set url (git config --get remote.$remote.url)
    set https_url (echo $url | string replace -r 'git@(.+):' 'https://$1/')
    $BROWSER $https_url
end
