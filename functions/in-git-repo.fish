function in-git-repo --argument-names _dir
    set dir (default $_dir .)
    git -C $dir rev-parse --git-dir &> /dev/null
end
