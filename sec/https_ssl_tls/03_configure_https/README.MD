* créer un second virtualhost:
  * ```sudo vim /etc/apache2/sites-available/miaradia.mg.conf```
  * add values :
    ```
    
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
           </VirtualHost>      
          
      
      
      ```
* activer le module ssl du serveur apache : 
  ```sudo a2enmod ssl```
``` ```
* pour relancer apache
  ``` sudo systemctl restart apache2```

