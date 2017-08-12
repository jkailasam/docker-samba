#!/bin/bash
mkdir -p /config/logs

for i in jkailasam brinda; do 
	if [[ ! $(getent passwd $i) ]] ; then
		useradd -s /bin/false $i
	fi
done

if [ -f "/config/local-SID" ]; then
	SID=$(cat /config/local-SID)
	net setlocalsid $SID
fi

if [ -f "/config/smbpasswd" ]; then
	pdbedit -i smbpasswd:/config/smbpasswd
fi

if [ -f "/config/passdb.tdb" ]; then
	cp /config/passdb.tdb /var/lib/samba/private/passdb.tdb
fi

if [ ! -f "/config/smb.conf" ]; then
	cp /defaults/smb.conf /config/smb.conf
fi
