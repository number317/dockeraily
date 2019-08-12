#!/bin/bash
main(){
    docker run -it \
               -v $HOME/Codes:/Codes \
               -v $PWD/maven:/root/.m2 \
               --name maven \
               maven:3.6.1-jdk-8-slim \
               sh
}

main
