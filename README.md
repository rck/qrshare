[![Build Status](https://travis-ci.org/rck/qrshare.svg?branch=master)](https://travis-ci.org/rck/qrshare)
[![Docker Automated build](https://img.shields.io/docker/automated/rck/qrshare.svg)](https://hub.docker.com/r/rck81/qrshare/)

# fpigs
Share text via QR code in terminal

# Synopsis

```
Usage: qrshare TEXT
  -version
    	Print version and exit
```

# Releases
Pre-built binaries are provided [here](https://github.com/rck/qrshare/releases/latest). Please note that these
binaries are automatically built by [Travis-CI](https://travis-ci.org). Your decision if you trust them.

# Docker
```
docker pull rck81/qrshare
docker run -it --rm rck81/qrshare TEXTTOSHARE
```
