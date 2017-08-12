#!/bin/bash
mkdir -p /config/logs

for i in jkailasam brinda; do 
	if [[ ! $(getent passwd $i) ]] ; then
		useradd -s /bin/false $i
	fi
done

if [ -f "/config/smbpasswd" ]; then
	pdbedit -i smbpasswd:/config/smbpasswd
fi

if [ ! -f "/config/smb.conf" ]; then
	cp /defaults/smb.conf /config/smb.conf
fi
