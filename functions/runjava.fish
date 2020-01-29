# Defined in /var/folders/7v/b0z6dsqj1fx8k5rf8x121l580000gn/T//fish.5wyj8x/runjava.fish @ line 2
function runjava --argument-names file
	javac $file
  java (string replace .java '' $file) $argv[2..0]
end
