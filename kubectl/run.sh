#!/bin/bash
docker run -it --name kubectl -v /home/cheon/Docker/kubectl/config:/root/.kube/config alpine/kubectl:v1.10.2
