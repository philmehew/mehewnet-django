FROM python:3.8-alpine
RUN apk add --no-cache --virtual .build-deps gcc musl-dev \
 && pip install cython \
 && apk del .build-deps
 
MAINTAINER Philip Mehew
ENV PYTHONUNBUFFERED 1

copy ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user
