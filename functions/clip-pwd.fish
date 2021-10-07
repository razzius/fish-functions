function clip-pwd
    pwd | string replace ~ '~' | pbcopy
end
