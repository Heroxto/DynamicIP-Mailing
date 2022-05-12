#!/bin/bash

#Checking IP Address

newIP=$(curl https://ipinfo.io/ip)
echo $newIP

#he IP is in the $newIP var

if [ -f "/var/ip.txt" ]
then
	echo "ip.txt exist, checking what is in it"
else
	echo "ip.txt is missing, creating ip.txt"
	touch /var/ip.txt
fi

IP=$(cat /var/ip.txt)

#if ip.txt is empty, i guess it's the first time you use the script. the new ip will be written in the file.

if [[ $IP == "" ]]
then
	IP=$newIP
	echo $newIP > /var/ip.txt
	echo "ip.txt is empty, writting new ip in it."
else
	echo "An IP is in the ip.txt, comparing..."
fi

#Test, la nouvelle IP est elle égale à l'ancienne ?

if [[ $newIP == $IP ]]
then
	echo "IP is the same"

else
	echo "IP has changed, sending an email."
	echo $newIP > /var/ip.txt
	(echo "IP address has changed, now it's " $(cat ip.txt)) > message.txt
	#mail -s "New IP" -a "From:Name of Mail User <exemple@mail.com>" $1 < message.txt
	
fi
