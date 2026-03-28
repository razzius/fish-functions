function doc --argument-names command
    man $command
    or $command --help | pager
end
