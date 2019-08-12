#!/bin/bash
main(){
    docker run -it \
               -p 1313:1313 \
               -v $HOME/Codes:/Codes \
               --name hugo \
               cheon/hugo:alpine
}

main
