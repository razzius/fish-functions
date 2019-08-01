# Defined in - @ line 2
function browse-pr
    set response (http --auth razzius:$GITHUB_API_TOKEN https://api.github.com/repos/goodeggs/(git repo-name)/pulls\?q=is:pr\&head=goodeggs:(git current))
    if test (echo $response | jq length) = 0
        echo no PR
    else
        set number (echo $response | jq .[0].number)
        open https://github.com/goodeggs/(git repo-name)/pull/$number
    end
end
