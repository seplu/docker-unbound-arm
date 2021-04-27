FROM arm32v7/alpine:3.12.7

LABEL maintainer="Sebastian Płudowski <sepludowski@gmail.com>"

COPY qemu-arm-static /usr/bin/

RUN apk add --update --no-cache curl ca-certificates s6 unbound
RUN curl -o /etc/unbound/root.hints https://www.internic.net/domain/named.cache

COPY files/ /
RUN chmod a+x /service/*/run

EXPOSE 53/udp 53/tcp

ENTRYPOINT ["/bin/s6-svscan","/service"]
