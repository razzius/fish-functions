function postexec_source_profile --on-event fish_postexec
	if test "$argv" = "vi ~/.profile"
source ~/.profile
end
end
