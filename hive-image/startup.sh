#!/bin/bash

cd $HIVE_HOME/bin

if [ "$1" == "metastore" ]
then
  ./schematool -dbType mysql -initSchema --verbose
  ./hive --service metastore
else
  hadoop fs -mkdir       /tmp
  hadoop fs -mkdir -p    /user/hive/warehouse
  hadoop fs -chmod g+w   /tmp
  hadoop fs -chmod g+w   /user/hive/warehouse
  # Add user
  groupadd hadoop
  useradd -g hadoop kaden
  hadoop fs -mkdir /user/kaden/
  hadoop fs -chown -R kaden:hadoop /user/kaden
  hdfs dfsadmin -refreshUserToGroupsMappings

  echo "execute the default, which is hiveserver2"
  ./hiveserver2  --hiveconf hive.server2.enable.doAs=true
fi
