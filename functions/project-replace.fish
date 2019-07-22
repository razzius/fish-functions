function project-replace --argument a b
	find . -print -exec sed -i'' "s/$a/$b/g" {} \;
end
