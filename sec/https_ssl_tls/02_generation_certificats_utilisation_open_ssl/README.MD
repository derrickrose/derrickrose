* creer un dossier certificat dans /etc/ssl/
  ``` sudo mkdir miaradia.mg```
* creer un dossier private dans notre dossier parent
  ``` cd miaradia.mg && sudo mkdir private```
  * generer certifcat 
  sans mot de passe (-nodes)
    ``` sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout private/miaradia.mg.key -out miaradia.mg.crt```
     il va demander une serie d'information
        * country
        * state
        * locality
        * orga name
        * orga unit name (departement dans le societe)
        * common name (url site)
        * adresse email