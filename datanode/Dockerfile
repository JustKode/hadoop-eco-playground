FROM hadoop-base-image:3.3.0

# DataNode Web UI 응답 여부를 통해 Healthcheck
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3  CMD curl -f http://localhost:9864/ || exit 1

ADD hdfs-site.xml $HADOOP_CONF_DIR

RUN mkdir /opt/hadoop/dfs/data
VOLUME /opt/hadoop/dfs/data

RUN mkdir -p /opt/hadoop/yarn/data
RUN mkdir -p /opt/spark/eventLog

ADD start.sh /start.sh
RUN chmod a+x /start.sh

# WebUI, 데이터전송
EXPOSE 9864 9866 8042

CMD ["/start.sh"]