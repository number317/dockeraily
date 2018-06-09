#!/bin/bash
init_dir(){
    ln -sfv $HOME/Code/blog $HOME/Docker/hugo/
}

main(){
    init_dir
    docker run -it \
               -p 1313:1313 \
               -v $HOME/Docker/hugo/blog:/blog \
               --name hugo \
               alpine/hugo:0.40.1
}

main
