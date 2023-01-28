docker build -t base-image:1.0 ./base-image

arch=$(uname -m)
if [[ $arch == arm* ]]; then
    echo "arm version"
    docker build -t hadoop-base-image:3.3.0 ./hadoop-base-image-arm64
else
    echo "amd version"
    docker build -t hadoop-base-image:3.3.0 ./hadoop-base-image-amd
fi

docker build -t hadoop-namenode:3.3.0 ./namenode
docker build -t hadoop-resource-manager:3.3.0 ./resource-manager
docker build -t yarn-timeline-server:3.3.0 ./yarn-timeline-server
docker build -t hadoop-datanode:3.3.0 ./datanode