FROM python:3
ENV PYBASE /pybase #here will be stored all dependencies by pipenv
ENV PYTHONUSERBASE $PYBASE
ENV PATH $PYBASE/bin:$PATH
ENV FLASK_APP /app/notes/__init__.py
RUN pip install pipenv

WORKDIR /tmp
COPY Pipfile .
RUN pipenv lock # to create lock file
RUN PIP_USER=1 PIP_IGNORE_INSTALLED=1 pipenv install -d --system --ignore-pipfile
   # in order to pipenv to behave the way we expect to install all dependencies to the install dir
   # --system in order to install to user directory instead of virutal env
   # pipenv will compare the lock with the current pip file

COPY . /app/notes
WORKDIR /app
EXPOSE 80
CMD ["gunicorn","-b 0.0.0.0:80", "notes:create_app()"]

