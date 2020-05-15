#!/bin/bash
# Name of the group you want to set up - change this to whatever group name you want to give permissions to
groupname=audio
currentuser=$(id -u -n)
# Ulimits file contents
filecontents="@${groupname}   -  rtprio     95
@${groupname}   -  memlock    unlimited"

# Does the group exist? If not, create it
getent group $groupname \
 || echo "Creating ${groupname} group and adding ${currentuser} to it" \
 && groupadd $groupname
 
 useradd -G $groupname $currentuser

# Choose which file to edit, depending on whether there's a /etc/security/limits.d dir
if [[ -d "/etc/security/limits.d" ]]
then
	filetoedit="/etc/security/limits.d/${groupname}.conf"
else
	filetoedit="/etc/security/limits.conf"
fi


if [[ -f "$filetoedit" ]]
then
	# I'm not going to mess with that file if it's there...
	echo "$filetoedit already exists. Check if its contents contain the following; if not, paste them in."
	echo "$filecontents"
else
	echo "$filetoedit does not exist, creating with the appropriate contents"
	touch "$filetoedit"
	echo "$filecontents" | tee -a $filetoedit
fi
