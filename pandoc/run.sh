#!/bin/bash
main(){
    docker run -it \
               -v $HOME/Codes:/Codes \
               --name pandoc \
               cheon/pandoc:jessie
}

main
