#!/bin/bash

for i in * ; do
  if [ -d "$i" ]; then
    if [ "$i" != "youcompleteme" ]; then
      echo updating $i...
      cd $i
      git fetch
      cd ..
      echo done
    fi
  fi
done
