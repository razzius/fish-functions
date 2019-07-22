# Defined in /Users/razzi/.config/fish/functions/sleep-notify.fish @ line 2
function sleep-notify --argument time
	bash -c "sleep $time; notify" &
end
