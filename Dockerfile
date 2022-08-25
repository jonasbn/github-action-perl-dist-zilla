FROM jonasbn/ebirah:0.6.0

WORKDIR /opt
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
