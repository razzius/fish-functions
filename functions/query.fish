function query
    open 'https://duckduckgo.com/?q='(echo $argv | string replace --all ' ' '%20')
end
