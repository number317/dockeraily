#!/bin/bash
init_dir(){
    docker run -d -e MYSQL_ROOT_PASSWORD="1qaz!QAZ" --name mysql_temp mysql:5.7
    docker cp mysql_temp:/etc/mysql/mysql.conf.d $PWD/
    mv $PWD/mysql.conf.d $PWD/conf
    docker cp mysql_temp:/var/lib/mysql $PWD/
    mv $PWD/mysql $PWD/data
    docker stop mysql_temp && docker rm mysql_temp
}

main(){
    if [[ ! -d mysql_conf || ! -d mysql_data ]]; then
        init_dir
    fi
    docker run -d \
        -p 3306:3306 \
        -e MYSQL_ROOT_PASSWORD="1qaz!QAZ" \
        -v $PWD/conf:/etc/mysql/conf.d:rw \
        -v $PWD/data:/var/lib/mysql:rw \
        --name mysql \
        mysql:5.7
}

main
