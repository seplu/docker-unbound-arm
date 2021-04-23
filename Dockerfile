FROM arm32v7/alpine:3.12.7

LABEL maintainer="Sebastian Płudowski <sepludowski@gmail.com>"

COPY qemu-arm-static /usr/bin/

RUN apk --no-cache add bash unbound

EXPOSE 53

CMD ["/opt/unbound_run.sh"]

ADD ./files /opt/unbound
RUN chmod a+x /opt/unbound/*
