function mkusertmp --description 'Make a user-specific tmpdir in your home directory like Daniel Bernstein warned us about'
    mkdir -p ~/tmp
    mktemp -d -p ~/tmp/
end
