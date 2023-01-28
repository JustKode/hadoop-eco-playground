FROM hadoop-base-image:3.3.0

HEALTHCHECK CMD curl -f http://yarn-timeline-server:8188/ || exit 1

ADD start.sh /start.sh
RUN chmod a+x /start.sh

# 8188 : yarn timeline web UI port
# 10200 : yarn timeline service port
EXPOSE 8188 10200

CMD ["/start.sh"]