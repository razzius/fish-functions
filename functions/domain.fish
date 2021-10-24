function domain
read url
echo $url | trim-scheme | cut -d / -f 1
end
