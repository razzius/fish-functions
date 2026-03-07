function pw --wraps=pass --argument url
    set domain_raw $url

    set domain (echo $domain_raw | domain | trim-left www.)

    if file-exists ~/.password-store/$domain.gpg
        pass -c $domain
        return 0
    end

    # TODO doesn't handle subdirectories
    set match (find-matching-pass $domain) || return 1

    set file (echo $match | trim-right .gpg | trim-left ~/.password-store/)
    if not string-empty $file
        pass -c $file
    else
        pass generate -c $domain
        git -C ~/.password-store push
    end
end
