#!/bin/bash
init_dir(){
    docker run -d --name httpd_temp httpd
    docker cp httpd_temp:/usr/local/apache2/conf $PWD/
    docker cp httpd_temp:/usr/local/apache2/htdocs $PWD/
    docker stop httpd_temp && docker rm httpd_temp
}

main(){
    if [[ ! -d conf && ! -d htdocs ]]; then
        init_dir
    fi
    docker run -d \
               -p 80:80 \
               -v $PWD/conf:/usr/local/apache2/conf:rw \
               -v $PWD/htdocs:/usr/local/apache2/htdocs:rw \
               --name httpd \
               httpd
}

main
