#!/bin/bash
init_dir(){
    docker run -d --name fluent-bit_temp fluent/fluent-bit
    docker cp fluent-bit_temp:/fluent-bit/etc $PWD/conf
    docker cp fluent-bit_temp:/fluent-bit/log $PWD/log
    docker stop fluent-bit_temp && docker rm fluent-bit_temp
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
