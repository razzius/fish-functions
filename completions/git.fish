source /usr/local/share/fish/completions/git.fish

complete -f -c git -n '__fish_git_using_command to' -a '(git branch-names)' --description 'Branch'
