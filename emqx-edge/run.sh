#!/bin/bash
init_dir(){
    docker run -d --name emqx-edge_temp emqx/emqx-edge:v4.1.2
    docker cp emqx-edge_temp:/opt/emqx/etc $PWD/
    docker cp emqx-edge_temp:/opt/emqx/data $PWD/
    docker stop emqx-edge_temp && docker rm emqx-edge_temp
}

main(){
    init_dir
    docker run -d \
           --name emqx-edge \
           -p 11883:1883 \
           -p 28083:8083 \
           -p 28883:8883 \
           -p 28084:8084 \
           -p 38083:18083 \
           -v $PWD/etc:/opt/emqx/etc \
           -v $PWD/data:/opt/emqx/data \
           emqx/emqx-edge:v4.1.2
}

main
