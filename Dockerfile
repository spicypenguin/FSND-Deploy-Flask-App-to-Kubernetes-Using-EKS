# base image is python:stretch
FROM python:stretch

# set the working directory to /app
WORKDIR /app

# upgrade pip
RUN pip install --upgrade pip

# pull over the requirements file
COPY ./requirements.txt /app/requirements.txt

# install dependencies
RUN pip install -r requirements.txt

# copy the rest of the application
COPY . /app

# `docker run` should kick off the gunicorn server, exposing 8080
ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]