#!/bin/bash
init_dir(){
    docker run -d --name nginx_temp nginx
    docker cp nginx_temp:/etc/nginx/nginx.conf $HOME/Docker/nginx/
    docker cp nginx_temp:/etc/nginx/conf.d $HOME/Docker/nginx/
    docker cp nginx_temp:/usr/share/nginx/html $HOME/Docker/nginx/
    docker stop nginx_temp && docker rm nginx_temp
}

main(){
    init_dir
    docker run -d \
               -p 80:80 \
               -v $HOME/Docker/nginx/nginx.conf:/etc/nginx/nginx.conf:rw \
               -v $HOME/Docker/nginx/conf.d:/etc/nginx/conf.d:rw \
               -v $HOME/Docker/nginx/html:/usr/share/nginx/html:rw \
               --name nginx \
               nginx
}

main
