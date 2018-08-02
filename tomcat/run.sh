#!/bin/bash
init_dir(){
    docker run -d --name tomcat_temp tomcat
    docker cp tomcat_temp:/usr/local/tomcat $HOME/Docker/tomcat/
    docker stop tomcat_temp && docker rm tomcat_temp
}

main(){
    init_dir
    docker run -d \
               -v $HOME/Docker/tomcat/tomcat:/usr/local/tomcat \
               --name tomcat \
               tomcat
}

main
