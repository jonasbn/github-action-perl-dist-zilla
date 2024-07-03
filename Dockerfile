FROM jonasbn/ebirah:0.9.0

ARG NOW

WORKDIR /opt
USER root
COPY entrypoint.sh ./entrypoint.sh
RUN chmod -v +x ./entrypoint.sh

LABEL org.opencontainers.image.base.name="registry.hub.docker.com/jonasbn/ebirah"
LABEL org.opencontainers.image.url="https://github.com/jonasbn/github-action-perl-dist-zilla"
LABEL org.opencontainers.image.source="https://github.com/jonasbn/github-action-perl-dist-zilla"
LABEL org.opencontainers.image.authors="https://jonasbn.github.io/"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.created="$NOW"

WORKDIR /tmp

ENTRYPOINT ["/opt/entrypoint.sh"]
