function vagrant-ssh
    vagrant ssh
    or begin
        if vagrant status | grep -E 'poweroff|aborted|not created|saved' >/dev/null
            vagrant up
            vagrant ssh
        end
    end
end
