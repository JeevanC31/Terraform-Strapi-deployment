#!/bin/bash
set -e

# wait for internet
until curl -s https://google.com >/dev/null; do
  sleep 10
done

apt update -y
apt install -y docker.io
systemctl start docker
systemctl enable docker

docker rm -f strapi || true

docker run -d \
  --name strapi \
  -p 1337:1337 \
  -e HOST=0.0.0.0 \
  -e PORT=1337 \
  strapi/strapi:latest
