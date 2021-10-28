function git-add
    if any-arguments $argv
      if test "$argv" = '...'
        git add ../..
      else
        git add $argv
      end
    else
        git add .
    end
end
