function last-thing --description 'Guess the target from the last command'
history -1 | last-word | string replace '~' $HOME
end
