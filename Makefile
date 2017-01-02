BINARY=qrshare
OS=linux openbsd darwin windows

VERSION=`git describe --tags --always --dirty`

LDFLAGS=-ldflags "-X main.Version=${VERSION}"

all: test build

get-deps:
	go get github.com/mdp/qrterminal
	go get github.com/mdp/rsc/qr

build: get-deps
	go build ${LDFLAGS} -o ${BINARY}

test: get-deps
	go test

install:
	go install ${LDFLAGS}

release:
	for os in ${OS}; do \
		GOOS=$$os GOARCH=amd64 go build ${LDFLAGS} -o ${BINARY}-$$os-amd64; \
	done

doc: build
	help2man -s 1 --no-discard-stderr -n "Share text via QR code in terminal" ./${BINARY} -N -o ${BINARY}.1

clean:
	for os in ${OS}; do \
		f=${BINARY}-$$os-amd64; \
		if [ -f $$f ] ; then rm $$f ; fi; \
	done

	if [ -f ${BINARY} ] ; then rm ${BINARY} ; fi

distclean: clean
	if [ -f ${BINARY}.1 ] ; then rm ${BINARY}.1 ; fi

.PHONY: clean install
