function edit-git
    $EDITOR (git-changing-files | head -1)
end
