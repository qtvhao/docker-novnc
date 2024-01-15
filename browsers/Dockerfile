FROM debian:oldstable

RUN apt-get update && apt-get install -y wget
RUN apt update && which google-chrome-stable || \
    (wget -nc https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt install -y ./google-chrome-stable_current_amd64.deb && \
    rm ./google-chrome-stable_current_amd64.deb)
RUN apt-get update \
	&& apt-get install -y \
		curl \
		libxext-dev libxrender-dev libxtst-dev \
		wget
RUN apt-get update \
    && apt-get install -y \
        xvfb

RUN set -ex; \
    apt-get update; \
    apt-get install -y \
      novnc \
      supervisor \
      x11vnc \
      xterm \
      xvfb

RUN apt-get update \
    && apt-get install -y \
        dbus-x11

CMD ["/bin/bash", "-c", "dbus-uuidgen > /var/lib/dbus/machine-id && mkdir -p /var/run/dbus && dbus-daemon --config-file=/usr/share/dbus-1/system.conf --print-address && sleep 1 && /usr/bin/google-chrome-stable --no-sandbox"]
