## configurer https dans nginx et forcer les requetes en https (rediriger les http vers https )

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

### configuration https sur nginx

* create a directory miaradia.mg inside /etc/ssl/
  `sudo mkdir /etc/ssl/miaradia.mg`
* create a directory private inside /etc/ssl/miaradia.mg
  `sudo mkdir /etc/ssl/miaradia.mg/private && cd /etc/ssl/miaradia.mg`
* create auto-signed ssl certificate :

```
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout private/miaradia.mg.key -out miaradia.mg.crt
```

* éditer le fichier /etc/nginx/sites-available/miaradia.mg.conf et remplacer par :

```
server {
        listen 80;
        listen [::]:80;
        return 301 https://miaradia.mg
}

server {
        listen 443;
        listen [::]:443;
        
        server_name miaradia.mg www.miaradia.mg;
        
        root /var/www/miaradia.mg;
        index index.html
        
        location / {
                 try_files $uri $uri/ =404;
        }
        
        ssl_certificate /etc/ssl/miaradia.mg/miaradia.mg.crt
        ssl_certificate_key /etc/ssl/miaradia.mg/private/miaradia.mg.key
}


```

### Tips:

#### check status server nginx :

```sudo systemctl status nginx.service```

#### reload nginx conf

```sudo systemctl reload nginx```

#### valider conf nginx (as sudoer)

```nginx -t```

### NB

* pour utiliser une autorité certifiance aller voir le chapitre 05
* la plus grande différence entre apache et nginx est que nginx ne considère pas les certificats intermediaire,
  de ce fait on ajoute la valeur dans le certificat du site mais de préférence certificat du site en debut du fichier (public crt ou cert)

