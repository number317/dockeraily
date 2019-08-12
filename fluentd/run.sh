#!/bin/bash
init_dir(){
    docker run -d --name fluentd_temp fluent/fluentd
    mkdir -p conf
    docker cp fluentd_temp:/fluentd/etc/fluent.conf $PWD/conf/
    docker cp fluentd_temp:/fluentd/log $PWD/
    docker cp fluentd_temp:/fluentd/plugins $PWD/
    docker stop fluentd_temp && docker rm fluentd_temp
}

main(){
    init_dir
    docker run -it \
               -v $PWD/conf/:/fluentd/etc/ \
               -v $PWD/log:/fluentd/log \
               -v $PWD/plugins:/fluentd/plugins \
               -p 24225:24224 \
               -u root \
               --name fluentd \
               fluent/fluentd:v1.0
}

main
