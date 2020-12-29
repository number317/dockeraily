#!/bin/bash
init_dir(){
    docker run -d -e MYSQL_ROOT_PASSWORD="1qaz!QAZ" --name mysql_temp mysql:5.7
    docker cp mysql_temp:/etc/mysql/mysql.conf.d $PWD/
    mv $PWD/mysql.conf.d $PWD/conf
    mkdir -p data
    docker stop mysql_temp && docker rm mysql_temp
}

main(){
    if [[ ! -d conf || ! -d data ]]; then
        init_dir
    fi
    docker run -d \
        -p 3306:3306 \
        -e MYSQL_ROOT_PASSWORD='1qaz!QAZ' \
        -v $PWD/conf:/etc/mysql/mysql.conf.d:rw \
        -v $PWD/data:/var/lib/mysql:rw \
        --name mysql \
        mysql:5.7
}

main
