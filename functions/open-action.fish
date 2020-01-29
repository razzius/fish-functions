function open-action
    open https://github.com/$GITHUB_USERNAME/(basename $PWD)/commit/(git commit-id)/checks
end
