#!/bin/bash
set -e
SSL_DIR="nginx/ssl"
mkdir -p "$SSL_DIR"
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout "$SSL_DIR/selfsigned.key" \
  -out "$SSL_DIR/selfsigned.crt" \
  -subj "/CN=localhost"
echo "Self-signed SSL certificate generated in $SSL_DIR"