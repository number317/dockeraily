#!/bin/bash
docker run -it \
    -v $HOME/Codes:/workspace \
    -v /usr/share/fonts/:/usr/share/fonts \
    --name graphviz \
    cheon/graphviz \
    sh
