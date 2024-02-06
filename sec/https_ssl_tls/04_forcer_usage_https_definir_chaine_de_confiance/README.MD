* forcer utiliation https :
__________________________________________________________
* * pour se faire modifier la conf virtualhost qui se trouve sous /etc/apache2/sites-available/miaradia.mg.conf

```sudo vim /etc/apache2/sites-available/miaradia.mg.conf```

* * supprimer les directives DocumentRoot et Directory
ajouter la redirection permanente

* * la conf totale devient :

```
        <VirtualHost *:80>
               ServerName miaradia.mg
               ServerAlias www.miaradia.mg  
               RedirectPermanent / https://miaradia.mg
        </VirtualHost> 

        <VirtualHost *:443>
               DocumentRoot /var/www/miaradia.mg
               ServerName miaradia.mg
               ServerAlias www.miaradia.mg  
               <Directory /var/www/miaradia.mg>
                    Require all granted
               </Directory>
               SSLEngine on
               SSLCertificateFile /etc/ssl/miaradia.mg/miaradia.mg.crt
               SSLCerfificateKeyFile /etc/ssl/miaradia.mg/private/miaradia.mg.key
               # Autres directives ici
        /VirtualHost>      
          


```

* * recharger la conf apache
```sudo sytemctl reload apache2```

* * tips sur vim : taper 2 fois sur bouton d pour supprimer une ligne
taper 3 et 2 fois sur bouton d pour supprimer 3 

* definir une chaine de confiance
* * role faire automatiquement confiance aux certificats 
* * probleme de notre certificat c'est autosigné (nous meme qui a créé mais personne a validé) n'importe qui peut prétendre etre google ou ...
* * navigateur par defaut ne fait jamais confiance à un certif autosigné
* * pour remedier, demander à une autorité certifiante de valider notre certificat
## tout comme notre CIN, un certificat ssl contient signature emetteur (certificate issuer)
* * il s'agit d'un autre cert ssl qui se sert de sa clée privée pour contre signer notre certificat
* * cette signature est facilement vérifié en utilisant la clée public du certificat emetteur 
* * il s'agit de faire confiance à l'emetteur du certificat pour automatiquement valider tous les certif que cette emetteur a contre signer
* * nous avons donc décider de faire confiance au certificat emetteur pour contre signer, mais on a juste déplacer le probleme
* * c'est là qu'interviennet les certificats racines (Root CA)
* * certificat ssl autosigné qu'on fait confiance par défaut (pour la plupart installer dans les OS)
* * ils appartiennent à des sociétés de confiance comme : GlobalSign, Comodo, DigiCert, Verisign ...
* * microsoft, apple, adobe émettent aussi leurs propres autorités certifiantes racines 
* * comme on fait confiance aux certif racines, on fait automatiquement confiance aux certif émis par eux 
* * pour ne pas rompre la chaine de confiance , les root ca ne sont utilisés que rarement, d'ou certificat intermediate
* * =>> votre certificat ssl, intermediate CA, Root CA
* * etape

navigateur authentifier (etape handshake)
navigateur cherche savoir si faire confiance explicitement au certif envoyé par le serveur => NON
navigateur recherche certificat ssl qui a emis celui du site (certificat intermediaire)
navigateur utilise alors clé publique de cet certif intermediaire pour valider la signature de notre certif 
navigateur cherche a savoir si on fait confiance à ce cetificat intermediaire => NON
navigateur cherche certificat qui a emis le certificat intermediaire (le plus souvent root CA)
navigateur utilise clée public du certif racine pour valider signature certif intermediaire

## ou trouver les certificats
* linux /etc/ssl/certs
* windows barre de recherche avec mot clé cert
* mac application  > utilitaires > (trousseau d'acces ou keychain access)