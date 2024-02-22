## renouveler son certif ssl

on peut utiliser les memes csr, juste aller vers le site et valider le certificat, pas besoin de changer ni la clé
publique ni la clé privée ni rien

Tips: supprimer le cache du navigateur si probleme de site signalé non-sécurisé

## pour renouveler automatiquement avec let's encrypt et certbot

* let's encrypt site gratuit pour certification, un certif émis par let's encrypt est valide que 90 jours mais
  renouvelable à chaque fois et est possible de renouveler que dans les 1 mois avant la fin de période de validité

* certbot outil pour renouveler certif qui utilise protocole ACME (Automatic Certificate Management Environment)
  site : certbot.eff.org
  prerequisites : terminal , site on line with port 80 (http only), a server that you have admin rights

* installer certbot :
  pour un site qui tourne sous nginx, si le site est sur apache, on installe python3-certbot-apache
  ```sudo apt install python3-certbot-nginx```

* executer la commande pour configurer https et installer certificat :
  ```sudo certbot --nginx -d www.miaradia.mg -d miaradia.mg```
  il va demander :
    * adresse email
    * acceptation term and condition
    * partage email (non)
    * mettre en place redirection automatique sur la version sécurisé
      ==> resultat certif généré, clé privée générée, virtualhost set ...

* mettre en place le renouvelement automatique de certificat:
  commande à utiliser
  ```sudo cerbot renew -q``` (quiet)
  placer donc un cron dans /etc/cron.d