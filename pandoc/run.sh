#!/bin/bash
main(){
    docker run -it \
               --user $(id -u) \
               -v $HOME/Codes:/Codes \
               --name pandoc \
               cheon/pandoc:jessie
}

main
