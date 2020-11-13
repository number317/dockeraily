#!/bin/bash
init_dir(){
    docker run -d --name python_temp python:3.8.6
    docker cp python_temp:/usr/local/lib/python3.8/site-packages $PWD/
    docker stop python_temp && docker rm python_temp
}

main(){
    init_dir
    docker run -it \
               -v $PWD/site-packages:/usr/local/lib/python3.8/site-packages/ \
               -v $HOME/Codes:/workspace \
               --name python \
               python:3.8.6 \
               bash
}

main
