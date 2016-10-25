#!/bin/bash
sudo docker build -t blog .
sudo docker run -d -p 4000:4000 -t blog:latest
