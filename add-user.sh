#!/bin/bash
echo "INFORME UM LOGIN"
read USER
echo "CRIANDO USUÁRIO $USER"
docker run -v $PWD/vpn-data:/etc/openvpn --rm -it openvpn easyrsa build-client-full $USER nopass
docker run -v $PWD/vpn-data:/etc/openvpn --rm openvpn ovpn_getclient $USER > $USER.ovpn
