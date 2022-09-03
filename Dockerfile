FROM jonasbn/ebirah:0.7.0

WORKDIR /opt
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
