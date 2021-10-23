function clone --argument url
    clone-cd $url ~/forks/(repo-from-url $url)
end
