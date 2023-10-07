function ssh-segfault
  expect -c 'spawn ssh root@segfault.net
    expect "root@segfault.net\'s password: "
    send "segfault\n"
    interact'
end
