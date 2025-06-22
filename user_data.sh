#!/bin/bash
apt-get update -y
apt-get install -y docker.io
systemctl start docker
systemctl enable docker
docker pull silverdeath366/my-nginx
docker run -d -p 80:80 silverdeath366/my-nginx
