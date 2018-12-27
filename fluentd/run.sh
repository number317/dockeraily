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
    docker run -d \
               -v $PWD/conf/fluent.conf:/fluentd/etc/fluent.conf \
               -v $PWD/log:/fluentd/log \
               -v $PWD/plugins:/fluentd/plugins \
               -p 24224:24224 \
               --name fluentd \
               fluent/fluentd
}

main
