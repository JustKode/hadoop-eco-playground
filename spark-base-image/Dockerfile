FROM hadoop-base-image:3.3.0

ENV SPARK_VERSION=3.2.2
ENV SPARK_FILE_NAME=spark-3.3.1-bin-hadoop3
ENV SPARK_URL=https://archive.apache.org/dist/spark/spark-3.3.1/spark-3.3.1-bin-hadoop3.tgz

RUN apt-get update && apt-get install -y wget
RUN wget $SPARK_URL
RUN tar -xvzf $SPARK_FILE_NAME.tgz && rm $SPARK_FILE_NAME.tgz
RUN mv $SPARK_FILE_NAME /opt
RUN ln -s /opt/$SPARK_FILE_NAME /opt/spark

ENV SPARK_HOME=/opt/spark
ENV PATH=$PATH:$SPARN_HOME/bin

RUN mkdir $SPARK_HOME/eventLog

ADD spark-defaults.conf $SPARK_HOME/conf