#!/bin/bash
groupmod -g $gid geppetto
usermod -u $uid -g $gid geppetto

exec su -ls "/bin/bash" -c "/home/geppetto/geppetto $ARGS" geppetto
