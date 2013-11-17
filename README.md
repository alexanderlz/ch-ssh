ch-ssh
======

Wrapper around knife tool, to allow easy ssh/scp handling when working with Chef


Dependencies:
--------------------

knife.rb present


Usage:
--------------------

ch-ssh.sh $SERVER_NAME ${REGULAR SSH PARAMS IF NEEDED}

ch-scp.sh $SERVER_NAME:$FILE1 $LOCALFILE_2  ${REGULAR SCP PARAMS IF NEEDED}  or ch-scp.sh $LOCALFILE_1 $SERVER_NAME:$FILE2

where $SERVER_NAME can be partial server name, if several nodes match - you will have to select one of them,



