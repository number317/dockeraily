#!/bin/bash
init_dir(){
    docker run -d --name nginx_temp nginx
    docker cp nginx_temp:/etc/nginx/nginx.conf $PWD/
    docker cp nginx_temp:/etc/nginx/conf.d $PWD/
    docker cp nginx_temp:/usr/share/nginx/html $PWD/
    docker stop nginx_temp && docker rm nginx_temp
}

main(){
    init_dir
    docker run -d \
               -p 80:80 \
               -v $PWD/nginx.conf:/etc/nginx/nginx.conf:rw \
               -v $PWD/conf.d:/etc/nginx/conf.d:rw \
               -v $PWD/html:/usr/share/nginx/html:rw \
               --name nginx \
               nginx
}

main
