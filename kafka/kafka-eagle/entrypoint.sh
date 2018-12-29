#!/bin/bash

sed -i "s/ZKSERVER/${ZKSERVER}/g" /kafka-eagle/conf/system-config.properties
chmod +x /kafka-eagle/bin/ke.sh
sh /kafka-eagle/bin/ke.sh start
