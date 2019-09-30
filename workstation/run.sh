#!/bin/bash
main(){
    docker run -it \
               -u cheon \
               -e TZ=Asia/Shanghai \
               -v $HOME/Codes:/home/cheon/Codes \
               --name workstation \
               cheon/workstation \
               bash
}

main
