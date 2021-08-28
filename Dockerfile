FROM elixir:alpine

RUN apk update
RUN apk add bash openssh procps zip unzip tar emacs-nox
RUN apk add git less
RUN apk add tzdata
RUN cp /usr/share/zoneinfo/America/New_York /etc/localtime && echo "America/New_York" >  /etc/timezone && apk del tzdata
RUN apk add ca-certificates
RUN apk add g++ make

RUN apk add openssh-client sqlite

RUN adduser -D elixir
USER elixir
ADD --chown=1000:1000 gitconfig /home/elixir/.gitconfig
ADD --chown=1000:1000 bashrc /home/elixir/.bashrc

RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix archive.install --force hex phx_new 1.5.9

ENV IMG elixir-util

WORKDIR /home/elixir/src

EXPOSE 4000

VOLUME [ "/home/elixir/src" ]
CMD /bin/bash
