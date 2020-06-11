function wip
    if git diff --cached --quiet
      git add .
    end
    git commit --no-verify -m "wip $argv"
end
