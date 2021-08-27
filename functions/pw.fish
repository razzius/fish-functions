function pw --wraps=pass --argument url
    if string-empty $url
        set clipboard (pbpaste)

        if not echo $clipboard | string match -rq '^https?://'
            echo 'pw: clipboard does not contain http url'
            return 1
        end

        set domain (pbpaste | domain)
    else
        set domain (echo $url | domain)
    end

    set match (ls ~/.password-store/*$domain* | trim-right .gpg | trim-left ~/.password-store/)
    if not string-empty $match
        pass -c $match
    else
        pass generate -c $domain
    end
end
