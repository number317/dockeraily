#!/bin/bash
init_dir(){
    mkdir -p $HOME/Docker/golang/go/{src,bin}
}

main(){
    init_dir
    docker run -it \
               -v $HOME/Docker/golang/go:/go \
               -v $HOME/Docker/golang/workspace:/workspace \
               --name golang \
               golang \
               bash
}

main
