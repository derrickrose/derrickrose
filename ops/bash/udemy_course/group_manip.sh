# prerequisites
# create an user
adduser user1

# create a group
# groupadd
addgroup baba #must be run as sudo
# lis all groups
cat /etc/group
# add user in a group
usermod -aG baba user1 #while user1 is a given user profile and baba is the group
# remove an user from a group
gpasswd -d user1 baba # baba is the group name
# delete a group
groupdel baba