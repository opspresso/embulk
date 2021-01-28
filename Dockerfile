FROM openjdk:8-alpine

ENV VERSION 0.10.26

RUN apk --update add libc6-compat bash curl

RUN apk --update add --virtual build-dependencies \
  && mkdir /embulk \
  && curl -o  /embulk/embulk -sL "https://dl.embulk.org/embulk-${VERSION}.jar" \
  && chmod +x /embulk/embulk \
  && apk del build-dependencies

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
