#!/bin/bash
for domain in `cat targets.ip`
do
   echo $domain
   `whois $domain | grep -E 'Domain Name|Registry|Registrar|Date|Name Server|Admin|Tech|DNSSEC' | grep -v -E 'modify existing|Registrars.|The Registry database contains|If you wish to' >> whois-results.txt`
   echo ' ' >> whois-results.txt
done
