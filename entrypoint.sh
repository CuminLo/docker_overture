#!/bin/sh

set -e

wget -c https://github.com/shawn1m/overture/releases/download/v1.6-rc1/overture-linux-amd64.zip -O /tmp/overture.zip

cd /tmp && unzip overture.zip && overture-linux-amd64 /user/local/bin/overture

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- overture "-c /etc/overture/config.json -v"
fi

exec "$@"
