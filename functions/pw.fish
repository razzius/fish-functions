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

    if pass list $domain >/dev/null
        pass -c $domain
    else
        pass generate -c $domain
    end
end
