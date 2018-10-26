# doctoc!
#
## Build me!
# docker build . -t doctoc
#
## Use Me!
# docker run -v ${PWD}:/home/node/doctoc doctoc $file

FROM node:8.11.3-jessie
LABEL maintainer "asdfgasfhsn dude@adsfgasfhsn.xyz"
ENV HOME /home/node

WORKDIR $HOME
RUN mkdir doctoc
COPY ./entrypoint.sh /
RUN chmod ugo+x /entrypoint.sh

RUN npm install -g doctoc

WORKDIR ${HOME}/doctoc
ENTRYPOINT [ "/entrypoint.sh" ]
