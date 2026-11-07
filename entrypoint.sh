#!/bin/sh
set -e
PORT="${PORT:-10000}"
sed "s/__PORT__/${PORT}/g" /etc/xray/config.template.json > /etc/xray/config.json
exec xray -c /etc/xray/config.json
