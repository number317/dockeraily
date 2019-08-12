#!/bin/bash
init_dir(){
    docker run -d --name logstash_temp docker.elastic.co/logstash/logstash:7.0.0
    docker cp logstash_temp:/usr/share/logstash/config $PWD/
    docker cp logstash_temp:/usr/share/logstash/pipeline/ $PWD/
    docker stop logstash_temp && docker rm logstash_temp
}

main(){
    init_dir
    docker run -it \
               -v $PWD/config/:/usr/share/logstash/config \
               -v $PWD/pipeline:/usr/share/logstash/pipeline \
               -e TZ="Asia/Shanghai" \
               --name logstash \
               docker.elastic.co/logstash/logstash:7.0.0
}

main
