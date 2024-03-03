#!/bin/bash

echo "listing Test Kitchens"
sudo kitchen list

echo "listing Docker (running) containers"
sudo docker ps -a

echo "listing Docker images"
sudo docker images
