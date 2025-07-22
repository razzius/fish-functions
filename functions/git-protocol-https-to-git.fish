function git-protocol-https-to-git
    set origin_url (git remote get-url origin)
    set git_protocol (echo $origin_url | sed 's|https://|git@|')
    set git_url (echo $git_protocol | sed 's|/|:|')
    git remote set-url origin $git_url
end
