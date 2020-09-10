#!/bin/bash

java -jar /embulk/embulk -version

echo "PLUGINS: $PLUGINS"
echo "COMMAND: $COMMAND"

if [ -n "$PLUGINS" ]; then
  java -jar /embulk/embulk gem install $PLUGINS
fi

java -jar /embulk/embulk $COMMAND
