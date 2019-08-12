#!/bin/bash
main(){
    docker run -it \
               -v $HOME/Codes:/workspace \
               --name dart \
               google/dart \
               bash
}

main
