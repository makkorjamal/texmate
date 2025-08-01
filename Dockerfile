FROM alpine:latest

ARG user=root
WORKDIR /$user
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
    openrc \
    dbus \
    luarocks \
    dbus-openrc \
    xauth \
    bash \
    bash-completion \
    xterm \
    nginx \
    websockify \
    novnc \
    musl-dev \
    mupdf \
    libx11-dev \
    libxft-dev \
    libxinerama-dev \
    eudev \
    nodejs \
    npm \
    mesa-dri-gallium \
    alacritty \
    texlive-full

RUN git clone https://git.suckless.org/dmenu
RUN git clone https://git.suckless.org/dwm

RUN mkdir -p ~/.config/ && \
    mkdir -p ~/.config/tigervnc/ && \
    mkdir -p ~/.config/nvim/

COPY dotfiles/nvim .config/nvim
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY dwm.desktop /usr/share/xsessions/
COPY start-vnc.sh /usr/local/bin/
COPY dotfiles/config.def.h dwm


RUN cd dwm && \
    make install
RUN cd dmenu && \
    make install

RUN echo "texmate" | vncpasswd -f > ~/.config/tigervnc/passwd && \
    echo -e "alacritty -e nvim &\nmupdf &\nnginx&" >> .xprofile && \
    chmod 600 ~/.config/tigervnc/passwd && \
    mkdir -p /usr/share/xsessions/
RUN echo 'session=dwm' >> ~/.config/tigervnc/config && \
    echo 'securitytypes=None' >> ~/.config/tigervnc/config && \
    echo 'localhost=no' >> ~/.config/tigervnc/config
RUN chmod +x /usr/local/bin/start-vnc.sh && \
    mkdir -p /www

VOLUME /data
EXPOSE 5901 6080 80
#
CMD [ "/usr/local/bin/start-vnc.sh"]
