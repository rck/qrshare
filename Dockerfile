FROM alpine:latest
MAINTAINER Roland Kammerer <dev.rck@gmail.com>

# docker run -it --rm qrshare TEXT

ENV QRSHARE_VERSION 0.1

RUN apk add --no-cache --virtual .build-deps wget ca-certificates
RUN wget "https://github.com/rck/qrshare/releases/download/v${QRSHARE_VERSION}/fpigs-linux-amd64" -O /usr/local/bin/qrshare
RUN chmod +x /usr/local/bin/qrshare
RUN apk del .build-deps

ENTRYPOINT ["qrshare"]
