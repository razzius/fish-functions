cd (mkusertemp)

echo 'TAP version 14'
echo '1..2'
touch file.txt

if file-exists file.txt
    echo ok
else
    echo not ok
end

if not file-exists nonexistant.txt
    echo ok
else
    echo not ok
end

remove file.txt
rmdir-.
