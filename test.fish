set -U _n_tests 0

echo TAP version 14

for f in test/*.fish
    fish $f
end

echo 1..$_n_tests

set -e _n_tests
