#!/bin/bash
for ip in `cat targets.ip`
do
   echo $ip
   if [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
   `shodan host  $ip >> shodan-results.txt`
   else
   `shodan domain $ip >> shodan-results.txt`
   fi
   echo ' ' >> shodan-results.txt
done
