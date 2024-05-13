FROM alpine:latest

RUN apk add bind
COPY ./named.conf /etc/bind/
COPY ./example.zone /etc/bind/
RUN named-checkconf /etc/bind/named.conf
RUN named-checkzone t.c /etc/bind/example.zone
EXPOSE 53/tcp 53/udp
