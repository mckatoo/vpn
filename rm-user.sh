#!/bin/bash
echo "INFORME UM LOGIN"
read USER
echo "REMOVENDO USUÁRIO $USER"
docker run -v $PWD/vpn-data:/etc/openvpn --rm -it openvpn rm /etc/openvpn/pki/reqs/$USER.req
docker run -v $PWD/vpn-data:/etc/openvpn --rm -it openvpn rm /etc/openvpn/pki/private/$USER.key
