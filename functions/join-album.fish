function join-album
    shntool join -o flac -a (basename (pwd)) *.flac
end
