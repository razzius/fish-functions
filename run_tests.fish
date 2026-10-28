set -U _n_tests 0

set result 0

echo TAP version 14

for f in test/*.fish
    fish $f || set result 1
end

echo 1..$_n_tests

set -e _n_tests

return $result
