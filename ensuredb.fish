function ensuredb --argument db
  if [ (count (psql -Atqc "\list $db")) -eq 1 ]
    echo dropping
    if not dropdb $db
      echo force quitting
      echo 'SELECT pg_terminate_backend(pg_stat_activity.pid)
            FROM pg_stat_activity
            WHERE datname = current_database()
            AND pid <> pg_backend_pid();' | psql -d $db > /dev/null
      dropdb $db
    end
  end
  createdb $db
end
