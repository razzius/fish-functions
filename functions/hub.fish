function __get_remote_for_current_branch
    if not string-empty $_remote
        echo $_remote
        return
    end

    set upstream (git rev-parse --abbrev-ref @{upstream} 2> /dev/null)

    if equals $status 0
        echo $upstream | cut -d / -f 1
        return
    end

    # No remote for current branch, assume "origin"
    echo origin
end

function hub --argument _remote
    set remote (__get_remote_for_current_branch $_remote)
    set url (git config --get remote.$remote.url)
    set https_url (echo $url | string replace -r 'git@(.+):' 'https://$1/')
    $BROWSER $https_url
end
