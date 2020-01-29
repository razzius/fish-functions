function renamedb --argument from to
    echo "alter database \"$from\" rename to \"$to\"" | psql -d template1
end
