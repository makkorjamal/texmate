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
    bash \
    bash-completion \
    xterm \
    dbus \
    dbus-openrc \
    websockify \
    novnc \
    musl-dev \
    libx11-dev \
    libxft-dev \
    libxinerama-dev \
    eudev \
    mesa-dri-gallium \
    alacritty
#    texlive-full
SHELL ["/bin/bash", "-c"]
RUN mkdir -p ~/.config/ && mkdir -p ~/.config/tigervnc/ && \
    echo "texmate" | vncpasswd -f > ~/.config/tigervnc/passwd && \
    chmod 600 ~/.config/tigervnc/passwd && \
    mkdir -p /usr/share/xsessions/
RUN git clone https://git.suckless.org/dmenu
RUN    cd dmenu && \
    make install

RUN git clone https://git.suckless.org/dwm
COPY dotfiles/config.def.h /dwm
RUN    cd dwm && \
    make install && \
    echo 'session=dwm' >> ~/.config/tigervnc/config && \
    echo 'securitytypes=None' >> ~/.config/tigervnc/config
COPY dwm.desktop /usr/share/xsessions/
#
COPY start-vnc.sh /usr/local/bin/
COPY bin/texpresso /usr/local/bin/
RUN chmod +x /usr/local/bin/start-vnc.sh

EXPOSE 5901 6080
#
CMD ["/usr/local/bin/start-vnc.sh"]
