FROM python:3.10.8-slim-buster

ENV DEBIAN_FRONTEND=noninteractive

# Fix: Install apt-get dependencies + git
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    gnupg \
    curl \
    && apt-get install -y git \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /requirements.txt

RUN pip install --upgrade pip && pip install --upgrade -r /requirements.txt

RUN mkdir /VJ-Forward-Bot
WORKDIR /VJ-Forward-Bot
COPY . /VJ-Forward-Bot

CMD gunicorn app:app & python3 main.py
