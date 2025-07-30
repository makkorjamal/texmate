FROM alpine:latest

RUN apk update && apk add --no-cache make \
    gcc \
    neovim \
    git \
    tigervnc \
    xorg-server \
    xinit \
    xf86-video-vesa \
    xf86-input-libinput \
    font-misc-misc \
    font-cursor-misc \
    xauth \
    xterm \
    websockify \
    novnc \
    musl-dev \
    libx11-dev \
    libxft-dev \
    libxinerama-dev \
    eudev \
    mesa-dri-gallium \
    xvfb

RUN mkdir -p ~/.config/ && mkdir -p ~/.config/tigervnc/ && \
    echo "texmate" | vncpasswd -f > ~/.config/tigervnc/passwd && \
    chmod 600 ~/.config/tigervnc/passwd && \
    mkdir -p /usr/share/xsessions/
RUN git clone https://git.suckless.org/dwm && \
    cd dwm && \
    make install && \
    echo 'session=dwm' >> ~/.config/tigervnc/config
COPY dwm.desktop /usr/share/xsessions/
#
COPY start-vnc.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start-vnc.sh

EXPOSE 5901 6080
#
CMD ["/usr/local/bin/start-vnc.sh"]
