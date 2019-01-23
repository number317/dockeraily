#!/bin/bash
main(){
    docker run -it \
               -v $HOME/Codes:/workspace \
               --name svn \
               cheon/svn:latest
}

main
