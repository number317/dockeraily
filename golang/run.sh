#!/bin/bash
init_dir(){
    mkdir -p $PWD/go
}

main(){
    init_dir
    docker run -it \
               -v $PWD/go:/go \
               -v $HOME/Codes:/workspace \
               --name golang \
               golang \
               bash
}

main
