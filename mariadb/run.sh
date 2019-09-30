#!/bin/bash
init_dir(){
    docker run -d -e MYSQL_ROOT_PASSWORD="temp" --name mariadb_temp mariadb
    docker cp mariadb_temp:/etc/mysql $PWD/
    mv $PWD/mysql $PWD/mysql_conf
    docker cp mariadb_temp:/var/lib/mysql $PWD/
    mv $PWD/mysql $PWD/mysql_data
    docker stop mariadb_temp && docker rm mariadb_temp
}

main(){
    if [[ ! -d mysql_conf || ! -d mysql_data ]]; then
        init_dir
    fi
    docker run -d \
               -p 3306:3306 \
               -e MYSQL_ROOT_PASSWORD="admin" \
               -v $PWD/mysql_conf:/etc/mysql:rw \
               -v $PWD/mysql_data:/var/lib/mysql:rw \
               --name mariadb \
               mariadb
}

main
