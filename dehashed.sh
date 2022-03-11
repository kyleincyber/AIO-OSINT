#!/bin/bash
clear

#Set Variables with User Input - Requires input validation
echo -e "Query Type Options: \nid, email, username, ip_address, name, address, phone, vin, domain" 
read -p "Enter Query Type: " queryType

read -p "Enter Query Subject (e.g. example.com if domain was selected): " subject

read -p "Enter Dehashed Email: " Email

read -p "Enter Dehashed API KEY: " APIKEY

#Displays the content of the variables so the user may manually validate their input
clear
echo -e "You chose: \n Query Type: $queryType\n Subject: $subject \n Dehashed Email: $Email \n API Key: $APIKEY" 

#Allows the user to confirm they wish to continue with the request if not then the script exits
while true
do
      read -r -p "Would you like to execute the request? [Y/n] " confirm
 
      case $confirm in
            [yY][eE][sS]|[yY])
                  echo "Yes"
                  break
                  ;;
            [nN][oO]|[nN])
                  echo "No"
                  exit
                  break
                  ;;
            *)
                  echo "Invalid input..."
                  ;;
      esac      
done

clear
echo "Running Curl request now..."

#Run the curl request to the Dehashed API
curl 'https://api.dehashed.com/search?query='$queryType':"'$subject'"&size=10000' -u $EMAIL:$APIKEY -H 'Accept: application/json' 