function repo-from-url --argument url
    basename $url | trim-right .git
end
