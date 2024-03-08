function adbc
	# Set _ADBC_PHONE using command line argument
	set _ADBC_PHONE $argv[1]

	# Check if _ADBC_PHONE is set
	if test -z "$_ADBC_PHONE"
	    echo "Usage: adbc <phone_address>"
	    return
	end

	# Run nmap to find an open port between 30000 and 49999 on the specified phone
	set _ADBC_PORT (nmap -sT $_ADBC_PHONE -p30000-49999 | awk -F/ '/tcp open/{print $1}')

	# Check if _ADBC_PORT is empty
	if test -z "$_ADBC_PORT"
	    # Print a message indicating that no open port was found
	    echo "No open port found on $_ADBC_PHONE in the specified range (30000-49999)"
	else
	    # Connect using adb to the specified phone and the discovered open port
	    adb connect $_ADBC_PHONE:$_ADBC_PORT $argv[2..-1]
	end

	# Unset the variables
	set -e _ADBC_PHONE _ADBC_PORT
end
