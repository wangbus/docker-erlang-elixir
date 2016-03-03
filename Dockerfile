FROM alpine:3.3
MAINTAINER James Wang <jw@slickage.com>

ENV ELIXIR_VERSION 1.2.2
ENV PATH $PATH:/opt/elixir-${ELIXIR_VERSION}/bin

RUN apk --update add erlang && rm -rf /var/cache/apk/*
RUN apk --update add --virtual build-dependencies wget ca-certificates && \
    wget https://github.com/elixir-lang/elixir/releases/download/v${ELIXIR_VERSION}/Precompiled.zip && \
    mkdir -p /opt/elixir-${ELIXIR_VERSION}/ && \
    unzip Precompiled.zip -d /opt/elixir-${ELIXIR_VERSION}/ && \
    rm Precompiled.zip && \
    apk del build-dependencies && \
    rm -rf /etc/ssl && \
    rm -rf /var/cache/apk/*

CMD ["/bin/sh"]
