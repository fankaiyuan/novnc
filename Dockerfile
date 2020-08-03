FROM treehouses/alpine:latest

ENV HOME=/home/alpine \
    SHELL=/bin/bash \
    VNC_PORT=5091 \
    NOVNC_PORT=6080 \
    NOVNC_HOME=/home/alpine/noVNC

RUN apk update && apk add --no-cache ca-certificates wget && \
    wget -qO- https://github.com/novnc/noVNC/archive/v1.2.0.tar.gz | tar xz -C $NOVNC_HOME && \
    chmod +x -v $NOVNC_HOME/utils/*.sh && \
    $NOVNC_HOME/utils/launch.sh --vnc localhost:5901

EXPOSE $VNC_PORT $NOVNC_PORT

#./utils/launch.sh --vnc localhost:5901