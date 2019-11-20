#!/bin/bash
init_dir(){
    mkdir -p data
}

main(){
    init_dir
    docker run -d \
        -p 9000:9000 \
        -e MINIO_ACCESS_KEY=root \
        -e MINIO_SECRET_KEY=admin \
        -v $PWD/data:/data \
        --name minio \
        minio/minio:edge \
        server /data
}

main
