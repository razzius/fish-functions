function mgist --argument file
    set gist_url (mdls -raw -n GistURL $file)
    if [ "$gist_url" = '(null)' ]
        set url (gist $file)
        xattr -w com.apple.metadata:GistURL $url $file
        echo $url
    else
        gist --update $gist_url $file
        echo $gist_url
    end
end
