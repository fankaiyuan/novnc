FROM treehouses/alpine:latest

ENV SHELL=/bin/bash \
    VNC_PORT=5091 \
    NOVNC_PORT=6080 \
    NOVNC_HOME=/home/noVNC

RUN apk update && apk add --no-cache git python2 procps && \
    mkdir -p $NOVNC_HOME && \
    wget -qO- https://github.com/novnc/noVNC/archive/v1.2.0.tar.gz | tar xz --strip 1 -C $NOVNC_HOME && \
    chmod +x -v $NOVNC_HOME/utils/*.sh

EXPOSE $VNC_PORT $NOVNC_PORT

CMD $NOVNC_HOME/utils/launch.sh --vnc localhost:5901
#./utils/launch.sh --vnc localhost:5901