FROM alpine
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk update && \
    apk add hugo git tzdata && \
    ln -sfv /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
