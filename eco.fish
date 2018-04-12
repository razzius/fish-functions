function eco
	eval 'echo $'(echo $argv | py -x 'x.upper()')
end
