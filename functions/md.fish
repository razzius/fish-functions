function md --argument file
    pandoc --from gfm --to html $file >/tmp/md.html
    open /tmp/md.html
end
