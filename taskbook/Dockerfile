## Taskbook container
#
# docker build . -t taskbook:latest
#
# docker run -t taskbook:latest \
# -v ${HOME}/.taskbook/:/home/node/.taskbook

FROM node:8.11.3-jessie
LABEL maintainer "asdfgasfhsn dude@adsfgasfhsn.xyz"

COPY ./entrypoint.sh /
RUN npm install --global taskbook
ENV HOME /home/node

WORKDIR $HOME

ENTRYPOINT [ "/entrypoint.sh" ]
