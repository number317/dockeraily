FROM alpine
ADD tinyproxy.conf /etc/tinyproxy/
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk update && \
    apk --no-cache add tinyproxy
EXPOSE 8888
ENTRYPOINT ["tinyproxy", "-d"]
