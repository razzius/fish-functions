function amend
  if git diff --quiet --cached --exit-code
    echo Nothing to amend
    return 1
  end

  git commit --amend
end
