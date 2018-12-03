#!/bin/bash
init_dir(){
    ln -sfv $HOME/Codes/blog $PWD/
}

main(){
    init_dir
    docker run -it \
               -p 1313:1313 \
               -v $PWD/blog:/blog \
               --name hugo \
               cheon/hugo:alpine
}

main
