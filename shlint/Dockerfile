## Bash/Shell Linter All-In-One container
#
# docker build . -t asdfgasfhsn/shlint:latest
#
# docker run -v ${PWD}:/home/shlint/lint/ \
# asdfgasfhsn/shlint:latest [shellcheck|shfmt|lint] [filename]
#

# Get shfmt
FROM golang:alpine

LABEL name="shfmt"
LABEL version="2.5.1"

ENV GOOS linux
ENV CGO_ENABLED 0
ENV SHFMT_VERSION 2.5.1

RUN apk add --no-cache git \
      && go get -u mvdan.cc/sh/cmd/shfmt \
      && git -C "$GOPATH/src/mvdan.cc/sh" checkout -q "v$SHFMT_VERSION" \
      && go install -a -ldflags '-extldflags "-static"' mvdan.cc/sh/cmd/shfmt

# Get shellcheck
FROM koalaman/shellcheck

# Make The Actual Container
FROM alpine:latest
LABEL maintainer "asdfgasfhsn dude@adsfgasfhsn.xyz"

USER root
ENV HOME /home/shlint

COPY entrypoint.sh /
RUN chmod ugo+x /entrypoint.sh

RUN apk add --no-cache bash shadow=4.5-r0
RUN useradd -ms /bin/bash -d ${HOME} -u 1000 shlint \
    && mkdir -p ${HOME} \
    && usermod -a -G 999 shlint
USER shlint

COPY --from=0 /go/bin/shfmt /bin/shfmt
COPY --from=1 /bin/shellcheck /bin/shellcheck

WORKDIR ${HOME}

ENTRYPOINT [ "/entrypoint.sh" ]
