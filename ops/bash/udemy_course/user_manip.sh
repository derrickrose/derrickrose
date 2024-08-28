#!/bin/bash

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