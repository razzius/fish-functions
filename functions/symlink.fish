function symlink --argument from to
	ln -s (abspath $from) (abspath $to)
end
