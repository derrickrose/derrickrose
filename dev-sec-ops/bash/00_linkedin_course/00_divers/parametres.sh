#pour recuperer les parametes, on utilise $1 ... jusqu'a $9
#$0 c'est le fichier script en question
echo "$0" "$1" "$2" "$9"

#pour recuperer la 10em param il faut ${10} si non il va considerer comme concatenation de $1 avec 0
echo "${10}"

# pour recuperer une liste de tous les parametres
echo "$@"
echo "${@}"
echo "$*" # la liste de tous les param dans une seule chaine

# vider un parametre avec la commande shift
echo "${@}"
shift
echo "${@}"
shift 5
echo "${@}"
