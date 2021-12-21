function new-vm
mkdir-cd ~/hack/vm-(isodatetime)
vagrant init debian/bullseye64
vagrant up
vagrant ssh
end
