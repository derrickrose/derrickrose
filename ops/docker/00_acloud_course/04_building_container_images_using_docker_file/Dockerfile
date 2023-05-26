FROM httpd:2.4

RUN apt update && apt update && apt autoremove && apt clean && rm -rf /var/lib/apt/lists/*
RUN rm -rf /usr/local/apache2/htdocs/index.html
WORKDIR /usr/local/apache2/htdocs
COPY ./web .

# We dont need to specify the starting point since it is already done inside the base image (httpd)