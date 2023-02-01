function hub
    set url (git config --get remote.origin.url)
    set https_url (echo $url | string replace ':' '/' | string replace 'git@' 'https://')
	$BROWSER $https_url
end
