function tunnel --argument host port
    echo "> ssh -NL $port:$host:$port $host"
    echo "Opening http://localhost:$port in browser..."
    ssh -NL $port:$host:$port $host &
    set ssh_pid $last_pid
    # todo https://stackoverflow.com/questions/29954169/automatically-establish-ssh-tunnel-wait-until-ssh-tunnel-is-established-then-e
    # rather than sleep 3
    sh -c "sleep 3; open http://localhost:$port" &
    # tada a hack; I want the prompt to be on its own line
    echo "Hit ENTER to stop."
    read -P ""
    kill $ssh_pid
end
