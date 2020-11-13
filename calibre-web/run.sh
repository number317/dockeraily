#!/bin/bash

init_dir(){
    if [[ ! -d $PWD/config ]] && [[ ! -d $PWD/books ]]; then
        docker run -d --name calibre-web_temp linuxserver/calibre-web
        docker cp calibre-web_temp:/config $PWD/config
        docker cp calibre-web_temp:/books $PWD/books
        docker stop calibre-web_temp && docker rm calibre-web_temp
    fi
    
}

main(){
    init_dir
    docker run -it \
           --name=calibre-web \
           -e PUID=1000 \
           -e PGID=985 \
           -e TZ=Asia/Shanghai \
           -e DOCKER_MODS=linuxserver/calibre-web:calibre \
           -p 8083:8083 \
           -v $PWD/config:/config \
           -v $PWD/books:/books \
           --restart unless-stopped \
           linuxserver/calibre-web
}

main
