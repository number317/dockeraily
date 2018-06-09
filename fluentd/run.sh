#!/bin/bash
init_dir(){
    docker run -d --name fluentd_temp fluent/fluentd
    docker cp fluentd_temp:/fluentd/etc/fluent.conf $HOME/Docker/fluentd/conf/
    docker stop fluentd_temp && docker rm fluentd_temp
}

main(){
    init_dir
    docker run -d \
               -v $HOME/Docker/fluentd/conf/fluent.conf:/fluentd/etc/fluent.conf \
               -v $HOME/Docker/fluentd/data:/fluentd/log \
               -v $HOME/Docker/fluentd/plugins:/fluentd/plugins \
               --name fluentd \
               fluent/fluentd
}

main
