function abbrev-add --argument shorthand
abbr -a -- $shorthand (echo $argv[2..] | string replace $HOME '~')
end
