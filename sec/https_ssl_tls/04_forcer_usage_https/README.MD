* forcer utiliation https :
  pour se faire modifier la conf virtualhost qui se trouve sous /etc/apache2/sites-available/miaradia.mg.conf

```sudo vim /etc/apache2/sites-available/miaradia.mg.conf```

supprimer les directives DocumentRoot et Directory
ajouter la redirection permanente

la conf totale devient :

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

recharger la conf apache
```sudo sytemctl reload apache2```

tips sur vim : taper 2 fois sur bouton d pour supprimer une ligne
taper 3 et 2 fois sur bouton d pour supprimer 3 lignes