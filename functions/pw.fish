function pw --wraps=pass --argument url
    set domain_raw $url

    set domain (echo $domain_raw | domain | trim-left www.)

    if file-exists ~/.password-store/$domain.gpg
        pass -c $domain
        return 0
    end

    # TODO doesn't handle subdirectories
    set matches (find ~/.password-store -maxdepth 1 -type f | grep $domain)
    if test (echo $matches | word-count) -gt 1
        echo "pw: more than 1: $matches"
        return 1
    end

    set match (echo $matches | trim-right .gpg | trim-left ~/.password-store/)
    if not string-empty $match
        pass -c $match
    else
        pass generate -c $domain
        git -C ~/.password-store push
    end
end
