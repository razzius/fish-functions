function abbrev-add --argument shorthand
  if test (count $argv) -eq 1
    set last_cmd (history | head -1)
    abbr -a -- $shorthand $last_cmd
    return
  end

  abbr -a -- $shorthand (echo $argv[2..] | unexpand-home-tilde)
end
