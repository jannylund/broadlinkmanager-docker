FROM python:3.11.9-slim-bullseye

LABEL maintainer="tomer.klein@gmail.com"

ENV PYTHONIOENCODING=utf-8
ENV ENABLE_GOOGLE_ANALYTICS=True

RUN apt update && apt install fping -yqq && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /tmp
RUN pip install --no-cache-dir -r /tmp/requirements.txt

RUN mkdir -p /opt/broadlinkmanager/data
WORKDIR /opt/broadlinkmanager/

EXPOSE 7020

COPY broadlinkmanager /opt/broadlinkmanager

ENTRYPOINT ["python", "broadlinkmanager.py"]