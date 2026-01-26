function in-git-repo --argument-names _dir
    set dir (default $_dir .)
    set in_git_worktree (git -C $dir rev-parse --is-inside-work-tree 2> /dev/null)
    equals $in_git_worktree true
end
