# Docker DNS over Tor 🐳

This small project lets you forward your DNS request over Tor. It supports DNS over UDP and TCP and uses Docker's healthcheck feature.

It utilizes [Cloudflare's _DNS over Tor_](https://developers.cloudflare.com/1.1.1.1/fun-stuff/dns-over-tor/) service to resolve DNS requests. The reason for this is that Tor's option `DNSPort` only [supports A, AAAA, and PTR requests](https://www.torproject.org/docs/tor-manual.html.en).

[![dockeri.co](https://dockeri.co/image/jbaumg/dns-over-tor)](https://hub.docker.com/r/jbaumg/dns-over-tor)

Source: https://github.com/jbaumg93/docker-dns-over-tor  
Docker Repository: https://hub.docker.com/r/jbaumg/dns-over-tor

## Usage

Starting the container with `docker run`:

```sh
docker run --rm -d --name dns-over-tor -p 53:53 -p 53:53/udp jbaumg/dns-over-tor
```

or with Docker Compose:

```sh
docker-compose up -d
```

Wait a few seconds for the container to start up. Test it with:

```sh
dig example.com @::1 +tcp
dig example.com @::1 +notcp
```