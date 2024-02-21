### configurer notre serveur nginx

* éditer le fichier conf :
  ```sudo vim /etc/nginx/sites-available/miaradia.mg.conf```
* insérer la conf suivante :

```
server {
        listen 80;
        listen [::]:80;
        
        server_name miaradia.mg www.miaradia.mg;
        
        root /var/www/miaradia.mg;
        index index.html
        
        location / {
                 try_files $uri $uri/ =404;
        }
}


```

* nginx do have enabled directory under /var/www/sites-enabled
* faire un lien symbolique (soft) ou symlink de la conf dans le dossier sites-enabled (better absolute path):
  ```ln -s /etc/nginx/sites-available/miaradia.mg.conf /etc/nginx/sites-enabled/miaradia.mg.conf```

### Tips:

#### check status server nginx :

```sudo systemctl status nginx.service```

#### reload nginx conf

```sudo systemctl reload nginx```

#### valider conf nginx (as sudoer)

```nginx -t```