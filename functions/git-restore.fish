function git-restore
if any-arguments $argv
git restore $argv
else
git restore .
end
end
