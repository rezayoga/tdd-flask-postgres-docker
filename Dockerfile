# pull official base image
FROM python:3.10.3-slim-buster

# set working directory
WORKDIR /Users/rezayoga/VisualStudioCodeProjects/flask-tdd-docker/project

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# add and install requirements
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# add app
COPY . .

# run server
CMD python manage.py run -h 0.0.0.0

# pull official base image
FROM postgres:14-alpine

# run create.sql on init
ADD create.sql /docker-entrypoint-initdb.d