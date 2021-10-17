function vim-that
set target (history -1 | last-word | string replace '~' $HOME)
if file-exists $target
vim $target
else
echo Last word of command was not a file: $target
end
end
