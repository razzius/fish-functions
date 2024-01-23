function tunnel --argument host port
    echo "> ssh -NL $port:$host:$port $host"

    ssh -NL $port:$host:$port $host &
    set ssh_pid $last_pid
    sleep .5

    # Check if ssh is still running; if not, exit
    kill -0 $ssh_pid 2> /dev/null || return 1

    retry sh -c "nc -z localhost $port 2> /dev/null"
    echo "Opening http://localhost:$port in browser..."
    open http://localhost:$port
    trap "kill $ssh_pid" SIGINT
    echo "Hit CONTROL-C to stop."
    wait $ssh_pid
end
