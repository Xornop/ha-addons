FROM ghcr.io/home-assistant/amd64-base:latest

COPY --from=phueber/prefetcharr:latest /prefetcharr /usr/local/bin/prefetcharr

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
