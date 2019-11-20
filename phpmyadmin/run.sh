#!/bin/bash
main(){
    docker run \
        --name myadmin \
        -d \
        -e PMA_ARBITRARY=1 \
        -p 8080:80 \
        phpmyadmin/phpmyadmin
}

main
#-e PMA_ABSOLUTE_URI=/mysql \
