function list-directories --argument _query
set query (default $_query */)
ls -d $query
end
