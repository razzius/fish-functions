function describe --argument command
for flag in $argv[2..]
man $command | sed -ne '/^  *'$flag'/,/^$/p'
end
end
