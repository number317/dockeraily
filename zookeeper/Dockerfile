FROM maven:3.6.0-jdk-8-alpine as builder
WORKDIR /opt/
RUN apk update && \
    apk add git && \
    git clone https://github.com/DeemOpen/zkui.git && \
    cd zkui && \
    mvn clean package

FROM java:openjdk-8u111-jdk-alpine
RUN mkdir /zkui
WORKDIR /zkui
COPY --from=builder /opt/zkui/target/zkui-2.0-SNAPSHOT-jar-with-dependencies.jar .
COPY --from=builder /opt/zkui/config.cfg .
COPY entrypoint.sh .
EXPOSE 9090
CMD ["/bin/sh", "/zkui/entrypoint.sh"]
