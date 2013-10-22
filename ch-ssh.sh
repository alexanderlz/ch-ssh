#!/bin/bash
PS3='Choose the server to connect to: '

#get the available nodes list
options=($(knife node list | grep $1))
select opt in "${options[@]}"
do
    case $opt in
        *) 
	echo 'connecting to '$opt
	ssh $(whoami)@$(knife node show $opt | grep IP\: | cut -d':' -f2 | tr -d ' ') ${@:2}
	break
	;;
    esac
done
