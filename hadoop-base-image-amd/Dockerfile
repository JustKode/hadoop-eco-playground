FROM base-image:1.0

RUN apt-get update && apt-get install -y curl 

ENV HADOOP_VERSION=3.3.0
ENV HADOOP_URL=https://archive.apache.org/dist/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz

# Hadoop 3.3.0
RUN curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
    && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
    && rm /tmp/hadoop.tar.gz

RUN ln -s /opt/hadoop-$HADOOP_VERSION /opt/hadoop \
    && mkdir /opt/hadoop/dfs \
    && ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop \
    && rm -rf /opt/hadoop/share/doc

ADD core-site.xml /etc/hadoop/
ADD mapred-site.xml /etc/hadoop/
ADD yarn-site.xml /etc/hadoop/

ENV HADOOP_HOME /opt/hadoop
ENV HADOOP_CONF_DIR /etc/hadoop

ENV PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
ENV YARN_CONF_DIR=$HADOOP_CONF_DIR