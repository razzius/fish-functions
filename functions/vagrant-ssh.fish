# Defined in /var/folders/5r/x8hb9kbd5751zn4pz9yq24s80000gn/T//fish.wzYV89/vagrant-ssh.fish @ line 2
function vagrant-ssh
    vagrant ssh
    or begin
        if vagrant status | grep -E 'poweroff|aborted|not created|saved' >/dev/null
            vagrant up
            vagrant ssh
        end
    end
end
