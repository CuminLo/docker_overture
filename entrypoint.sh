#!/bin/sh

set -e

if [ ! -f "/usr/local/bin/overture" ]; then
  wget -c https://glare.now.sh/shawn1m/overture/overture-linux-amd64 -O /tmp/overture.zip
  cd /tmp && unzip overture.zip && mv overture-linux-amd64 /usr/local/bin/overture
fi

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
  set -- overture "$@"
fi

exec "$@"
