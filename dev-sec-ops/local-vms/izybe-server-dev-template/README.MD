# Ubuntu server dev
A virtual machine on local which have those following characteristics:
* name : izybe-server-dev-template
* system : Ubuntu server amd64
* version : 20.04
* user : frils
* pass : frils
## preinstalled tools
* docker
* powershell
* awscli
## other tools installed
* file server
## network
* intern lan : fichier yam à créer dans /etc/netplan/ 01-intern-lan.yaml
  (voir fichier)
* avec la commande `cd /etc/netplan | sudo vi 01-intern-lan.yaml`
## registered host names
* avec la commande `vi /etc/hosts`
* ajouter les lignes des hosts nécessaires example : 192.168.1.11 izybe-desktop-01
