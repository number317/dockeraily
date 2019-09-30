#!/bin/bash
main(){
    docker run -it \
               -v $HOME/Codes:/home/cheon/Codes \
               -u cheon \
               --name rust \
               cheon/vscode-rust:1.37.0 \
               bash
}

main
