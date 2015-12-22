#!/bin/bash

lines=$(wc -l $1 | awk {'print $1'})
lastline=$((lines+1))
echo $lastline

if [ ! -e /tmp/.log_parser.check ]
then 
	sed -n  1,"$"p   $1 | egrep   'GET /forbidden.html' > /var/log/nginx/result.log
	touch /tmp/.log_parser.check
else	
	a=`cat /tmp/.lastline`
	sed -n  "$a","$"p   $1 | egrep   'GET /forbidden.html' > /var/log/nginx/result.log
	echo "Exit"
fi

echo $lastline > /tmp/.lastline
cat /tmp/.lastline
