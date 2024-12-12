#Server certificate

openssl genrsa -out private.key 2048

openssl req -new -sha256  \
        -config san.conf -extensions 'req_ext' \
        -key private.key \
        -out server.csr


