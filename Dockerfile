FROM openjdk:8-alpine

ENV VERSION 0.10.13

RUN apk --update add libc6-compat

RUN apk --update add --virtual build-dependencies curl \
  && mkdir /embulk \
  && curl -o  /embulk/embulk -L "https://dl.bintray.com/embulk/maven/embulk-${VERSION}.jar" \
  && chmod +x /embulk/embulk \
  && apk del build-dependencies

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
