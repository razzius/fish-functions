function pw --argument url
	set domain (domain $url)
if pass list $domain > /dev/null
pass -c $domain
else
pass generate -c $domain
end
end
