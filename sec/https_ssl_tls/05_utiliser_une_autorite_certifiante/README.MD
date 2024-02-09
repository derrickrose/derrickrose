Service payant sur eurodns.com
Il faut se faire valider l'appartenance au domaine tout d'abord 
### quelques types :

* Domain validation
* Organization validation (personne physique va valider)
* Extended validation (utilisation numero telephone)

### Générer une CSR:

* accéder au dossier /etc/ssl et y créer un nouveau répertoire miaradia.mg.signed pour placer notre certificat signé
  ```cd /etc/ssl && sudo mkdir miaradia.mg.signed```
* accéder au nouveau dossier nouvellement créé et y créer un nouveau dossier private :
  ```cd miaradia.mg.signed && sudo mkdir private```
* générer CSR certficate signing request
  ```sudo openssl req -new -nodes -newkey rsa:2048 -keyout private/miaradia.mg.key -out miaradia.mg.csr```
  => il y aura des infos à entrer surtout mettre www.miaradia.mg (avec www) sur common name pour etre sur que site avec www soit sécurisé
* envoyer le CSR au signataire et émettre notre certificat (clé public avec extension csr)
* attendre quelques minutes et remarquer présence de nouveau lien gérer votre certificat sur le compe au site eurodns

### Convertir la CSR en certificat
* recupérer le certificat donné par le site (copier) et coller dans le nouveau fichier certificat de notre serveur
* créer nouveau fichier pour y coller le text brute du certificat
```sudo vim miaradia.mg.crt```

### maintenant installer le nouveau certificat dans notre serveur apache
pour cela aller dans notre virtual host et préciser nouveau path de certificat 
* éditer notre virtualHost avec la commande :
```sudo vim /etc/apache2/sites-available/miaradia.mg.conf```
* changer les paths par les bonnes valeurs :
SSLCertificateFile : /etc/ssl/miaradia.mg/miaradia.mg.crt => /etc/ssl/miaradia.mg.signed/miaradia.mg.crt
SSLCertificateKeyFile : /etc/ssl/miaradia.mg/private/miaradia.mg.key => /etc/ssl/miaradia.mg.signed/private/miaradia.mg.key
* recharger la conf :
```sudo systemctl reload apache2```

Toutefois des fois le certificat intermediaire n'est pas validé par le navigateur, il faut l'ajouter manuellement
### installer manuellement certificat intermédiaire
* aller vers le site qui a vendu le certificat et récupérer le certificat intermediaire
* le copier coller vers /etc/ssl/miaradia.mg.signed/miaradia.mg.CA.crt (CA pour Certificate Authority)
* Puis dans notre virtualhost ajouter la ligne SSLCACertificateFile /etc/ssl/miaradia.mg.signed/miaradia.mg.CA.crt
