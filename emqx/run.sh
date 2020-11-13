#!/bin/bash
init_dir(){
    docker run -d --name emqx_temp emqx/emqx:v4.1.2
    docker cp emqx_temp:/opt/emqx/etc $PWD/
    docker cp emqx_temp:/opt/emqx/data $PWD/
    docker stop emqx_temp && docker rm emqx_temp
}

main(){
    init_dir
    docker run -d \
           --name emqx \
           -v $PWD/data:/opt/emqx/data \
           -v $PWD/etc:/opt/emqx/etc \
           emqx/emqx:v4.1.2

    # docker run -d \
    #        --name emqx \
    #        -p 1883:1883 \
    #        -p 8083:8083 \
    #        -p 8883:8883 \
    #        -p 8084:8084 \
    #        -p 18083:18083 \
    #        -v $PWD/data:/opt/emqx/data \
    #        -v $PWD/etc:/opt/emqx/etc \
    #        emqx/emqx:v4.1.2
}

main
