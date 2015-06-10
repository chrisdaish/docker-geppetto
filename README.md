Puppet Labs Geppetto
====================

Unofficial build of Puppet Labs Geppetto 4.3.1 running within a docker container.

Changelog
---------
```
v1.0
* Initial Commit.
```

Launch Command
---------------
```
docker run  -v $HOME/Documents:/home/geppetto/workspace:rw \
            -v /tmp/.X11-unix:/tmp/.X11-unix \
            -e uid=$(id -u) \
            -e gid=$(id -g) \
            -e DISPLAY=unix$DISPLAY \
            --name geppetto \
            chrisdaish/geppetto
```

FAQ
---
Note: If you receive the following Gtk error:

```
Gtk-WARNING **: cannot open display: unix:0.0
```
Simply allow the docker user to communicate with your X session

```
xhost +local:docker
``` 
