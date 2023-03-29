FROM ubuntu:22.04

RUN apt update -y

RUN apt upgrade -y

RUN apt install python3 wget -y

# TODO:
# RUN python3 -m ensurepip --upgrade

RUN mkdir /home/adopet

WORKDIR /home/adopet

COPY ./adopet /home/adopet/

COPY ./requirements.txt /home/

WORKDIR /home

RUN wget https://bootstrap.pypa.io/get-pip.py

RUN python3 get-pip.py

RUN pip install -r requirements.txt

WORKDIR /home/adopet

RUN python3 manage.py makemigrations

RUN python3 manage.py migrate

RUN python3 manage.py createsuperuser --email admin@example.com --username admin

RUN python3 manage.py runserver 0.0.0.0:8000
