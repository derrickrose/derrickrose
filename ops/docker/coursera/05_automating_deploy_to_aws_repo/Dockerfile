FROM python:3.6
RUN pip install Flask==1.0.2
COPY ../../.. /appdir
WORKDIR /appdir
EXPOSE 5000
CMD ["python", "app.py"]