FROM alpine

LABEL maintainer="jb{at}xn--wxa.ml"

RUN apk add --no-cache --update -q tor socat
RUN cp /etc/tor/torrc.sample /etc/tor/torrc
RUN rm -rf /var/cache/apk/*

EXPOSE 53/tcp
EXPOSE 53/udp

HEALTHCHECK --start-period=60s CMD getent hosts torproject.org || exit 1

CMD (socat TCP4-LISTEN:53,reuseaddr,fork SOCKS4A:0.0.0.0:dns4torpnlfs2ifuz2s2yf3fc7rdmsbhm6rw75euj35pac6ap25zgqad.onion:53,socksport=9050 &); (socat UDP4-LISTEN:53,reuseaddr,fork SOCKS4A:0.0.0.0:dns4torpnlfs2ifuz2s2yf3fc7rdmsbhm6rw75euj35pac6ap25zgqad.onion:253,socksport=9050 &); echo 'nameserver 127.0.0.1' > /etc/resolv.conf; su -s /bin/sh -c '/usr/bin/tor' tor
