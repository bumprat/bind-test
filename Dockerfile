FROM alpine:latest

RUN apk add bind
COPY ./named.conf /etc/bind/
COPY ./rndc-controls.conf /etc/bind/
COPY ./example.zone /etc/bind/
RUN named-checkconf /etc/bind/named.conf
RUN named-checkzone t.c /etc/bind/example.zone
RUN cat /etc/bind/rndc.key >> /etc/bind/named.conf
RUN cat /etc/bind/rndc-controls.conf >> /etc/bind/named.conf
EXPOSE 53/tcp 53/udp
