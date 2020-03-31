FROM alpine:3.11

EXPOSE 80
WORKDIR /app

ADD ./example /app

RUN apk add --update nginx redis nodejs npm yarn supervisor \
    && rm  -rf /tmp/* /var/cache/apk/* \
    && mkdir -p /data/nginx/cache/nextjs

ADD ./conf/nginx/nginx.conf /etc/nginx/nginx.conf
ADD ./conf/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
ADD ./conf/supervisor/supervisord.conf /etc/supervisord.conf

ENTRYPOINT ["supervisord"]
