function fingerprint --argument keyfile
    ssh-keygen -l -E md5 -f $keyfile
end
