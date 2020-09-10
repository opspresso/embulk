#!/bin/bash

/embulk/embulk -version

echo "PLUGINS: $PLUGINS"
echo "COMMAND: $COMMAND"

if [ -n "$PLUGINS" ]; then
  /embulk/embulk gem install $PLUGINS
fi

/embulk/embulk $COMMAND
