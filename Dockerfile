# FROM debian:stable-slim
FROM alpine

# RUN set -ex; \
#     apt-get update; \
#     apt-get install -y --no-install-recommends --no-install-suggests -y \
#       fluxbox
RUN apk add --no-cache \
      fluxbox
# RUN set -ex; \
#     apt-get update; \
#     apt-get install -y --no-install-recommends --no-install-suggests -y \
#       net-tools
# RUN set -ex; \
#     apt-get update; \
#     apt-get install -y --no-install-recommends --no-install-suggests -y \
#       novnc \
#       supervisor
RUN apk add --no-cache \
      novnc \
      supervisor
# RUN set -ex; \
#     apt-get update; \
#     apt-get install -y --no-install-recommends --no-install-suggests -y \
#       x11vnc \
#       xvfb
RUN apk add --no-cache \
      x11vnc \
      xvfb
RUN apk add --no-cache \
      bash
# Setup demo environment variables
ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1024 \
    DISPLAY_HEIGHT=768 \
    RUN_FLUXBOX=yes
RUN mkdir -p /app
COPY entrypoint.sh /app/
COPY supervisord.conf /app/
COPY conf.d /app/conf.d
CMD ["/app/entrypoint.sh"]
EXPOSE 8080
