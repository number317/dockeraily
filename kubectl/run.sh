#!/bin/bash
docker run -it --name kubectl -v $HOME/Docker/kubectl/config:/root/.kube/config alpine/kubectl:v1.10.2
