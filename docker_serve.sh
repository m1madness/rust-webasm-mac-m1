#!/usr/bin/env bash

docker build . -t game-of-life
docker run -dp 8080:8080 game-of-life
docker ps