# python & virtualenv
* set default python env
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.9 0
* pyenv 
https://realpython.com/intro-to-pyenv/

# docker


# postgres
* to download postgres image
https://hub.docker.com/_/postgres
docker pull postgress
* to run postgres
docker run --name postgres -e POSTGRES_PASSWORD=airflow -e POSTGRES_USER=airflow -e POSTGRES_DB=airflow -p5416:5432 -d postgres