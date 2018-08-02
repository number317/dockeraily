#!/bin/bash
init_dir(){
    docker run -d --name rabbitmq_temp rabbitmq
    docker cp rabbitmq_temp:/etc/rabbitmq/rabbitmq.conf $HOME/Docker/rabbitmq/conf
    docker cp rabbitmq_temp:/var/lib/rabbitmq/mnesia $HOME/Docker/rabbitmq/data/single
    docker stop rabbitmq_temp && docker rm rabbitmq_temp
}

main(){
    init_dir
    docker run -d \
               -h rabbitmq \
               -p 15672:15672 \
               -v $HOME/Docker/rabbitmq/conf/rabbitmq.conf:/etc/rabbitmq/rabbitmq.conf:rw \
               -v $HOME/Docker/rabbitmq/data/single:/var/lib/rabbitmq/mnesia:rw \
               --name rabbitmq \
               rabbitmq:3-management
}

main
