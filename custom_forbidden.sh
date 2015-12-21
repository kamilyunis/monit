#!/bin/bash

for (( i = 1; i >=0; i-- )) ; do grep $(date +%R -d "-$i  min") /var/log/nginx/access.log ; done | egrep 'GET /forbidden.html' | egrep -v '127.0.0.1'> /var/log/nginx/newfile


echo $? 

