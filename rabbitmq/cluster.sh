#!/bin/bash
docker run -d \
    -h rabbitmq-node1 \
    -e TZ=Asia/Shanghai \
    -e RABBITMQ_ERLANG_COOKIE='helloworld' \
    -v $HOME/Docker/rabbitmq/conf/cluster-rabbitmq.conf:/etc/rabbitmq/rabbitmq.conf \
    -v $HOME/Docker/rabbitmq/data/node1:/var/lib/rabbitmq/mnesia:rw \
    --add-host rabbitmq-node1:172.17.0.3 \
    --add-host rabbitmq-node2:172.17.0.4 \
    --add-host rabbitmq-node3:172.17.0.5 \
    --name rabbitmq-node1 \
    rabbitmq:3-management

docker run -d \
    -h rabbitmq-node2 \
    -e TZ=Asia/Shanghai \
    -e RABBITMQ_ERLANG_COOKIE='helloworld' \
    -v $HOME/Docker/rabbitmq/conf/cluster-rabbitmq.conf:/etc/rabbitmq/rabbitmq.conf \
    -v $HOME/Docker/rabbitmq/data/node2:/var/lib/rabbitmq/mnesia:rw \
    --add-host rabbitmq-node1:172.17.0.3 \
    --add-host rabbitmq-node2:172.17.0.4 \
    --add-host rabbitmq-node3:172.17.0.5 \
    --name rabbitmq-node2 \
    rabbitmq:3-management

docker run -d \
    -h rabbitmq-node3 \
    -e TZ=Asia/Shanghai \
    -e RABBITMQ_ERLANG_COOKIE='helloworld' \
    -v $HOME/Docker/rabbitmq/conf/cluster-rabbitmq.conf:/etc/rabbitmq/rabbitmq.conf \
    -v $HOME/Docker/rabbitmq/data/node3:/var/lib/rabbitmq/mnesia:rw \
    --add-host rabbitmq-node1:172.17.0.3 \
    --add-host rabbitmq-node2:172.17.0.4 \
    --add-host rabbitmq-node3:172.17.0.5 \
    --name rabbitmq-node3 \
    rabbitmq:3-management
