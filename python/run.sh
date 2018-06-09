#!/bin/bash
init_dir(){
    docker run -d --name python_temp python
    docker cp python_temp:/usr/local/lib/python3.6/site-packages $HOME/Docker/python/
    docker stop python_temp && docker rm python_temp
}

main(){
    init_dir
    docker run -it \
               -v $HOME/Docker/python/site-packages:/usr/local/lib/python3.6/site-packages/ \
               -v $HOME/Docker/python/workspace:/workspace \
               --name python \
               python \
               bash
}

main
