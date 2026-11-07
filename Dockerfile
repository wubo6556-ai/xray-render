# Render free web service — xray VLESS+WS+TLS
# Render injects $PORT (default 10000); container must listen on $PORT.
# Multi-stage: official xray image has no shell, copy binary into Alpine.
FROM ghcr.io/xtls/xray-core:latest AS builder
FROM alpine:3.20
RUN apk add --no-cache ca-certificates tzdata \
    && mkdir -p /etc/xray /usr/local/bin
COPY --from=builder /usr/local/bin/xray /usr/local/bin/xray
COPY config.template.json /etc/xray/config.template.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 10000
CMD ["/entrypoint.sh"]
