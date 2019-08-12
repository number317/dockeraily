#!/bin/bash
main(){
    docker run -it \
               -v $HOME/Codes:/workspace \
               --name rust \
               rust:slim \
               bash
}

main
