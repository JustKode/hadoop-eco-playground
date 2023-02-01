docker build -t base-image:1.0 ./base-image

arch=$(uname -m)
if [[ $arch == arm* ]]; then
    echo "arm version"
    docker build -t hadoop-base-image:3.3.0 ./hadoop-base-image-arm64
else
    echo "amd version"
    docker build -t hadoop-base-image:3.3.0 ./hadoop-base-image-amd
fi

docker build -t spark-base-image:3.1.1 ./spark-base-image

docker build -t spark-history-server:3.1.1 ./spark-history-server
docker build -t hadoop-namenode:3.3.0 ./namenode
docker build -t hadoop-resource-manager:3.3.0 ./resource-manager
docker build -t yarn-timeline-server:3.1.1 ./yarn-timeline-server
docker build -t hadoop-datanode:3.3.0 ./datanode
docker build -t hive-image:3.1.2 ./hive-image
docker build -t zeppelin:0.10.1 ./zeppelin