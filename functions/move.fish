function move --argument from to
  set count (count $argv | tr -d \n)
  if not test "$count" = 2; or not is-dir $to
    mv $argv
  end

  set name (basename $from)
  if file-exists $to/$name
    cp $to/$name /tmp
    echo move: backed up $to/$name to /tmp/$name
  end

  mv $from $to
end
