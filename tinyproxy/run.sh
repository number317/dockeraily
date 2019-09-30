#!/bin/bash

main(){
    docker run -d \
               -p 8888:8888 \
               --name tinyproxy \
               cheon/tinyproxy:alpine
}

main
