#!/bin/bash

sed -i "s/localhost:2181,localhost:2181/$ZKSERVER/g" config.cfg
java -jar /zkui/zkui-2.0-SNAPSHOT-jar-with-dependencies.jar
