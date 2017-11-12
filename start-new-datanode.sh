#!/usr/bin/env bash

i=${1}
i=${i:-3}
docker rm -f hadoop-slave${i}
docker run -itd --name=hadoop-slave${i} \
               --net=hadoop \
               --hostname=hadoop-slave${i} \
               sjt/hadoop:1.0


docker exec hadoop-slave${i} bash -c '$HADOOP_HOME/sbin/hadoop-daemon.sh start datanode'
