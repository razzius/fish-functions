function ssh-segfault
    expect -c '
    log_user 0
    spawn ssh root@segfault.net
    expect "root@segfault.net\'s password: "
    send "segfault\n"
    interact'
end
