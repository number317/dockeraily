#!/bin/bash
main(){
    docker run -d \
               -v $HOME/Docker/haproxy/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg:rw \
               --name haproxy \
               haproxy
}

main
