function guess-git-url --argument value
    if string match -qe https:// $value || string match -qe git@ $value
        echo $value
    else if string match -qe / $value
        echo https://github.com/$value
    else
        # Maybe it's a https://github.com/fish-shell/fish-shell type of url
        echo https://github.com/$value/$value
    end
end
