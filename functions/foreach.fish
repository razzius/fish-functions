function foreach --argument command
  for arg in $argv[2..]
    fish -c "$command $arg"
  end
end
