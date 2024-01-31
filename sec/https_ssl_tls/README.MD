* Secure web site:

*** ssl 1.0 en 94, ssl 2.0 en 1995 et ssl 3.0 en 96, banni en 2015 car beaucoup de vulnérabilité

*** successeur du ssl ==> fameux tls

*** tls 1.2 ou 1.3 (aout 2018) pour sécuriser

*** ssl et tls utilisent tous les 2 des cerfiticats

*** un certificat sert à crypter et authentifier

*** pour pouvoir assurer son rôle de cryptage, un certificat utilise une clé publique

*** pour pouvoir assurer son rôle d'authentification, un certificat utilise une serie d'info comme user, ville,
pays, émetteur, date début et date de fin

*** *.crt ou *.cer

*** CRYPTOGRAPHIE SYMETHRIQUE UTILISE MOT DE PASSE (émetteur et récepteur)

*** CRYPTOGRAPHIE à clé ASYMETHRIQUE (clé pub et privé) PKI (public key infrastrucuture) (algo complexe)

problème cryptographie à clé asymetrhique ==> performance, d'ou la création du handshake pour profiter de la vitesse de symetrique

*** handshake est le processus sur lequel un client établie une connection sécurisée en https sur un serveur 

* le processus handshake 
* * le client envoie un message hello et une liste protocole d'algo supporté et un random chaine de caracter
* * le serveur va choisir sur ses algo lequel utiliser parmis ceux supporté aussi
* * le serveur renvoie un message hello qui va contenir l'algo protocole, certificat ssl du serveur et server random

* le client passe à la phase authentification :
* * il verifie validité certificat envoyé par le serveur soit issue d'une autorité qu'il a confiance
* * verifie encodage url est le site visité, date validité ...
* * si tout va bien, client décide établir une communication sécurisée et renvoie une deuxième chaine de caractère pre-master secret aleatoire
* * le client se sert de la clé public qui se trouve dans la clé ssl pour crypter le pre-master secret
* * à ce stade le client et le serveur possèdent 3 chaines de carac aléatoires et utilisent ça pour avoir une clé de session
* * le client envoie alors le message client ready encodé avec la clé de session
* * pareil le serveur envoie le message server ready et les 2 utilisent la cryptographie symetrique


cf :  https://www.linkedin.com/learning/securiser-son-site-avec-un-certificat-ssl/bienvenue-dans-securiser-son-site-avec-un-certificat-ssl?resume=false
