# symlink should not allow linking from a nonexistant file

mkdir-cd test_symlink

symlink nonexistant anything 2> error.txt

set desired_pattern "symlink: `from` argument '.*' does not exist"
# echo error.txt should have: "symlink: `from` argument '...' does not exist"
# echo here it is:
set output (cat error.txt)
if not string match -qr $desired_pattern $output
    echo no match
    set result 1
else
    set result 0
end

# clean up
if string-empty $DEBUG
    echo cleanup
    rm error.txt
    rmdir-.
end

exit $result
