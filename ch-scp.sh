#!/bin/bash
PS3='Choose the server to connect to: '


if [[ "$1" == *:* ]]
then
      nodeName=${1%:*}
      srcFile=REMOTE_HOST:${1#*:}
      dstFile=$2
fi

if [[ "$2" == *:* ]]
then
      nodeName=${2%:*}
      srcFile=$1
      dstFile=REMOTE_HOST:${2#*:}
fi

#get the available nodes list
options=($(knife node list | grep $nodeName))
select opt in "${options[@]}"
do
    case $opt in
        *) 
	echo 'connecting to '$opt
	R_HOST=$(whoami)@$(knife node show $opt | grep IP\: | cut -d':' -f2 | tr -d ' ')
	SRC=${srcFile/REMOTE_HOST/$R_HOST}
	DEST=${dstFile/REMOTE_HOST/$R_HOST}
	scp $SRC $DEST ${@:3}
	break
	;;
    esac
done
