#!/bin/bash
main(){
    docker run -it \
               --user $(id -u) \
               -p 1313:1313 \
               -v $HOME/Codes:/home/cheon/Codes \
               --name hugo \
               cheon/hugo:alpine
}

main
