# Defined in /var/folders/7v/b0z6dsqj1fx8k5rf8x121l580000gn/T//fish.rqkO2h/vagrant-ssh.fish @ line 2
function vagrant-ssh
	vagrant ssh; or begin
    if vagrant status | grep -E 'poweroff|aborted|not created' > /dev/null
      vagrant up
      vagrant ssh
    end
  end
end
