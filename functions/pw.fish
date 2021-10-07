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

    set matches (ls ~/.password-store/ | grep $domain)
    if test (echo $matches | word-count) -gt 1
        echo 'pw: more than 1'
        return 1
    end

    set match (echo $matches | trim-right .gpg | trim-left ~/.password-store/)
    if not string-empty $match
        pass -c $match
    else
        pass generate -c $domain
    end
end
