docker run -d --restart unless-stopped -v /data:/home/jamal/data/ -p 5901:5901 -p 6080:6080 -p 80:80 --name texmate jamalmakkor/texmate:latest
