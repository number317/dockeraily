#!/bin/bash
init_dir(){
    docker run -d --name httpd_temp httpd
    docker cp httpd_temp:/usr/local/apache2/conf $HOME/Docker/httpd/
    docker cp httpd_temp:/usr/local/apache2/htdocs $HOME/Docker/httpd/
    docker stop httpd_temp && docker rm httpd_temp
}

main(){
    init_dir
    docker run -d \
               -p 80:80 \
               -v $HOME/Docker/httpd/conf:/usr/local/apache2/conf:rw \
               -v $HOME/Docker/httpd/htdocs:/usr/local/apache2/htdocs:rw \
               --name httpd \
               httpd
}

main
