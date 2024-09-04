#!/bin/bash

# to find out user and group names and numerical IDs
id
id root
id frils

# to find the name of the machine
hostname

# to find out information about operating system running on the machine
uname
uname -a #full info

# to find out the current logged in user (user shell time)
whoami
who

#add user need to be run using sudo
adduser user1

#to see the created user
cat /etc/passwd

#to change password for the user actual frilsfrils
passwd user1

# password are stored in
cat /etc/shadow

# delete user
userdel user1

# to verify you can list passwd and no more entry for user1
cat /etc/passwd