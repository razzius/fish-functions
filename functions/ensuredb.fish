function ensuredb --argument db
    psql -d $db -c "select pg_terminate_backend(pid) from pg_stat_activity where pid <> pg_backend_pid() and datname = '$db'" >/dev/null
    dropdb $db >/dev/null
    createdb $db
end
