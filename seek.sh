#!/bin/bash

if [ "$1" == '-d' ] ; then
   ARGS=('-type' 'd')
   shift
fi
if [ "$1" == '-f' ] ; then
   ARGS=('-type' 'f')
   shift
fi
if  [ "$1" == "" ] ; then
	printf "uso: 
	seek [PALAVRACHAVE]...\n"
	exit 1
fi

COMMAND="find ${ARGS[*]} 2> /dev/null | sed 's; ;\\\\ ;g' | sed 's;(;\\\\(;g'| sed 's;);\\\\);g'"
while [ "$1" != "" ] ; do
   COMMAND+=" | grep -i $1"
   shift
done

eval $COMMAND
