function unlink --argument file
	test -L $file; and rm $file
end
