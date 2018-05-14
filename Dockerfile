FROM alpine:3.7

WORKDIR  /var/www/app

RUN apk update && \
	apk add python3 python3-dev redis&& \
	pip3 install --upgrade pip && \
	rm -rf /var/cache/apk/*

COPY ./app ./

RUN pip3 install -r requirements.txt

EXPOSE 5000

ENTRYPOINT redis-server --daemonize yes && python3 app.py
