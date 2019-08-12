#!/bin/bash
main(){
    docker run -it \
               -v $HOME/Codes:/workspace \
               --name node \
               node:alpine \
               sh
}

main
