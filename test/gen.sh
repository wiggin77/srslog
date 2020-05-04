#!/bin/bash

openssl req \
    -newkey rsa:2048 \
    -nodes \
    -days 3650 \
    -x509 \
    -keyout ca.key \
    -out ca.crt \
    -subj "/CN=*"
openssl req \
    -newkey rsa:2048 \
    -nodes \
    -keyout privkey.pem \
    -out server.csr \
    -subj "/C=CA/ST=Toronto/L=Toronto/O=Wiggin77/OU=Wiggin77 Security Testing Dept/CN=*"
openssl x509 \
    -req \
    -days 3650 \
    -sha256 \
    -in server.csr \
    -CA ca.crt \
    -CAkey ca.key \
    -CAcreateserial \
    -out cert.pem \
    -extfile <(echo subjectAltName = IP:127.0.0.1)