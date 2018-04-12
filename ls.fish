function ls --description 'List contents of directory'
	gls --color --hide=__pycache__ --hide="*.pyc" $argv
end
