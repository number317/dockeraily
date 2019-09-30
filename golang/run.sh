#!/bin/bash
init_dir(){
    mkdir -p $PWD/go
}

main(){
    if [[ ! -d go ]]; then
        init_dir;
    fi
    init_dir
    docker run -it \
               -u cheon \
               --cap-add=SYS_PTRACE \
               --security-opt seccomp=unconfined \
               -v $PWD/go:/go \
               -v $HOME/Codes:/home/cheon/Codes \
               --name golang \
               cheon/vscode-go:1.12.9 \
               bash
}

main
