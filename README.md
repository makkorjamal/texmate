# TexMate

TexMate is a alpine based writing environment that comes with all the needed 
packages and plugins pre-installed, and runs in a local environment.

The windows manager is dwm from suckless.org and the menu is dmenu from the same
awesome people.


## Table of contents



- [Requirements](#requirements)
- [Installation](#installation)
- [Postprocessing](#Postprocessing)
- [Quick Start](#quick-start)

## Requirements

All you need is Docker to be installed in your system. You can follow the tutorial 
[here](https://docs.docker.com/engine/install/)

## Installation
You can  either pull the image from the Docker hub using the snippet.

```docker
docker run -d --restart unless-stopped -v /data:/home/jamal/data/ -p 5901:5901 -p 6080:6080 -p 80:80 --name texmate jamalmakkor/texmate:latest
```
or build it yourself by first cloning the repository

```docker
git clone https://github.com/makkorjamal/texmate.git
```
and then build the image locally. Feel free to modify it to your needs
```docker
docker build -t texmate .
```

### Other

The image is built on Alpine which is a very lightweight distro, but texlive-full
package suit is huge. This makes the image takes a lot of space.
> [!NOTE]
> If you need a smaller image you can modify the Dockerfile.
> Change the package from texlive-full to texlive-basic and add packages you need.
> Build the image locally.

## Postprocessing

After running the Docker. Go to this to the browser

```docker
http://localhost:6080/vnc.html
```
you can call a terminal by clicking on alt+p and typing alacritty. Then go to 
```docker
cd .local/share/nvim/lazy/coc.nvim/
```
and then run 
```docker
npm ci
```
this will install coc dependencies for nvim autocomplete.

## Quick Start
The video below shown how to Compile a Tex file in this docker image.

https://github.com/user-attachments/assets/9ec18e2e-27e5-42b5-a4fe-c3625a28b778
