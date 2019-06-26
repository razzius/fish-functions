# Defined in - @ line 2
function ls --description 'List contents of directory'
	gls -a --color --hide=__pycache__ --hide="*.pyc" $argv
end
