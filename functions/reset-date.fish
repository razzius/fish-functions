# Defined in /var/folders/5r/x8hb9kbd5751zn4pz9yq24s80000gn/T//fish.jjeqIX/reset-date.fish @ line 1
function reset-date
	sudo sntp -sS time.apple.com
end
