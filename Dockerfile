FROM python:3.10.8-slim-buster

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update and install git in one layer using apt-get
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Copy requirements file
COPY requirements.txt /requirements.txt

# Upgrade pip and install Python dependencies
RUN pip install --upgrade pip && pip install --upgrade -r /requirements.txt

# Prepare the working directory
RUN mkdir /VJ-Forward-Bot
WORKDIR /VJ-Forward-Bot

# Copy all project files into the working directory
COPY . /VJ-Forward-Bot

# Start the application
CMD gunicorn app:app & python3 main.py
