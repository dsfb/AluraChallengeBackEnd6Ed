FROM ubuntu:22.04

RUN apt update -y

RUN apt upgrade -y

RUN apt install python3 -y