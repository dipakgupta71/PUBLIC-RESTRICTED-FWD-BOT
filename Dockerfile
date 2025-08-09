FROM python:3.10.8-slim-buster

RUN rm -rf /var/lib/apt/lists/* && apt update && apt upgrade -y
RUN apt install -y git apt-transport-https ca-certificates gnupg curl
COPY requirements.txt /requirements.txt

RUN cd /
RUN python3 -m pip install --upgrade pip && pip3 install -U -r requirements.txt
RUN mkdir /VJ-Forward-Bot
WORKDIR /VJ-Forward-Bot
COPY . /VJ-Forward-Bot
CMD gunicorn app:app & python3 main.py


