#!/bin/bash
init_dir(){
    docker run -d -e MYSQL_ROOT_PASSWORD="temp" --name mariadb_temp mariadb
    docker cp mariadb_temp:/etc/mysql $HOME/Docker/mariadb/
    mv $HOME/Docker/mariadb/mysql $HOME/Docker/mariadb/mysql_conf
    docker cp mariadb_temp:/var/lib/mysql $HOME/Docker/mariadb/
    mv $HOME/Docker/mariadb/mysql $HOME/Docker/mariadb/mysql_data
    docker stop mariadb_temp && docker rm mariadb_temp
}

main(){
    init_dir
    docker run -d \
               -p 3306:3306 \
               -e MYSQL_ROOT_PASSWORD="admin" \
               -v $HOME/Docker/mariadb/mysql_conf:/etc/mysql:rw \
               -v $HOME/Docker/mariadb/mysql_data:/var/lib/mysql:rw \
               --name mariadb \
               mariadb
}

main
