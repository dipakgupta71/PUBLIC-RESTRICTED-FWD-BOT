--- /tmp/Dockerfile	2025-05-25 01:52:00.000000000 -0400
+++ /home/ubuntu/PUBLICRESTRICTEDBOT/VJ-Forward-Bot-main/Dockerfile	2025-08-09 00:42:39.427627415 -0400
@@ -1,12 +1,12 @@
-FROM python:3.10.8-slim-buster
-
-RUN apt update && apt upgrade -y
-RUN apt install git -y
-COPY requirements.txt /requirements.txt
-
-RUN cd /
-RUN pip3 install -U pip && pip3 install -U -r requirements.txt
-RUN mkdir /VJ-Forward-Bot
-WORKDIR /VJ-Forward-Bot
-COPY . /VJ-Forward-Bot
-CMD gunicorn app:app & python3 main.py
+FROM python:3.10.8-slim-buster
+
+RUN rm -rf /var/lib/apt/lists/* && apt update && apt upgrade -y
+RUN apt install -y git apt-transport-https ca-certificates gnupg curl
+COPY requirements.txt /requirements.txt
+
+RUN cd /
+RUN python3 -m pip install --upgrade pip && pip3 install -U -r requirements.txt
+RUN mkdir /VJ-Forward-Bot
+WORKDIR /VJ-Forward-Bot
+COPY . /VJ-Forward-Bot
+CMD gunicorn app:app & python3 main.py
