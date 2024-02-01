* transfert dossier site sur le serveur
* traditionellement un site sur ubuntu est dans /var/www/
* configure a virtualhost (dire sur note system les sites disponibles) /etc/apache2/sites-available/
    * create conf file : `touch miaradia.mg.conf`
    * insert values :
      ```
       <VirtualHost *:80>
           DocumentRoot /var/www/miaradia.mg
           ServerName miaradia.mg
           ServerAlias www.miaradia.mg  
           <Directory /var/www/miaradia.mg>
                Require all granted
           </Directory>
           # Autres directives ici
       </VirtualHost>      
      ```
    * activer le site :
      ``` sudo a2ensite miaradia.mg.conf```
    * pour recharger la modif
      ``` sudo systemctl reload apache2```
    * on doit avoir notre site qui fonctionnne
        