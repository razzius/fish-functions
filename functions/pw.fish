function pw --argument url --wraps pass
	set domain (domain $url)
if pass list $domain > /dev/null
pass -c $domain
else
pass generate -c $domain
end
end
