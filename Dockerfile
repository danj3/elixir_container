FROM elixir:alpine

RUN apk update
RUN apk add bash openssh procps zip unzip tar emacs-nox
RUN apk add git less
RUN apk add tzdata
RUN cp /usr/share/zoneinfo/America/New_York /etc/localtime && echo "America/New_York" >  /etc/timezone && apk del tzdata
RUN apk add ca-certificates

RUN adduser -D elixir
USER elixir
COPY gitconfig /home/elixir/.gitconfig
COPY bashrc /home/elixir/.bashrc
ENV IMG elixir_util

WORKDIR /home/elixir/src

VOLUME [ "/home/elixir/src" ]
CMD /bin/bash
