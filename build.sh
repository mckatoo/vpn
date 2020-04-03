#!/bin/bash

echo "INFORME A URL OU IP DO SERVIDOR OPENVPN: "
read UrlOrIp
echo "INFORME A PORTA DO SERVIDOR OPENVPN: "
read Port
echo "CRIANDO ARQUIVOS DE CONFIGURAÇÃO udp://$UrlOrIp:$Port"
docker run -v $PWD/vpn-data:/etc/openvpn --rm openvpn ovpn_genconfig -u udp://$UrlOrIp:$Port && \
echo "CRIANDO CHAVES PRIVADAS"
docker run -v $PWD/vpn-data:/etc/openvpn --rm -it openvpn ovpn_initpki && \
echo "CRIANDO CONTAINER OPENVPN"
docker run -v $PWD/vpn-data:/etc/openvpn -d --name openvpn -p $Port:1194/udp --cap-add=NET_ADMIN openvpn && \
