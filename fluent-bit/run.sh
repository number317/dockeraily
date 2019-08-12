#!/bin/bash
init_dir(){
    if [[ ! -d $PWD/conf ]] && [[ ! -d $PWD/log ]]; then
        docker run -d --name fluent-bit_temp fluent/fluent-bit:1.0-debug
        docker cp fluent-bit_temp:/fluent-bit/etc $PWD/conf
        docker cp fluent-bit_temp:/fluent-bit/log $PWD/log
        docker stop fluent-bit_temp && docker rm fluent-bit_temp
    fi
}

main(){
    init_dir
    docker run -d \
               -v $PWD/conf:/fluent-bit/etc \
               -v $PWD/log:/fluent-bit/log \
               --name fluent-bit \
               fluent/fluent-bit
}

main
