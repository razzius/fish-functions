# symlink should not allow linking from a nonexistant file

mkdir-cd test_symlink

symlink nonexistant anything 2> error.txt

echo error.txt should have: "symlink: `from` argument `...` does not exist"
echo here it is:
cat error.txt

# clean up. TODO have a environment variable to avoid cleaning up for inspection
rm error.txt
rmdir-.
