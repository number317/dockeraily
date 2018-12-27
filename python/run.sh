#!/bin/bash
init_dir(){
    docker run -d --name python_temp python
    docker cp python_temp:/usr/local/lib/python3.7/site-packages $PWD/
    docker stop python_temp && docker rm python_temp
}

main(){
    init_dir
    docker run -it \
               -v $PWD/site-packages:/usr/local/lib/python3.7/site-packages/ \
               -v $HOME/Codes:/workspace \
               --name python \
               python \
               bash
}

main
