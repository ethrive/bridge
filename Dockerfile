ARG FROM_IMAGE=zyclonite/zerotier
ARG FROM_VERSION=latest

FROM ${FROM_IMAGE}:${FROM_VERSION}

RUN apk add --no-cache --purge --clean-protected iptables nginx iproute2 \
  && rm -rf /var/cache/apk/*

RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

ENV LOG_PATH=/var/log/supervisor

COPY entrypoint.sh /opt
COPY index.html /www
COPY nginx.conf /etc/nginx

EXPOSE 9993/udp

ENTRYPOINT ["/opt/entrypoint.sh"]

CMD ["-U"]
