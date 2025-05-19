docker build -t burpsuite .

docker run -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  --hostname burpsuite \
  -it --rm \
  --name burpsuite \
  burpsuite