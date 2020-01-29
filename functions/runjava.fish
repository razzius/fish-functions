function runjava --argument-names file
    javac $file
    java (string replace .java '' $file) $argv[2..0]
end
