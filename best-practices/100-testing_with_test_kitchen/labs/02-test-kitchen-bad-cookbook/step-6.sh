#!/bin/bash

echo "listing Test Kitchens"
echo "----------------------------------------"
echo ""
echo ""
sudo kitchen list

echo "listing Docker (running) containers"
echo "----------------------------------------"
echo ""
echo ""
sudo docker ps -a

echo "listing Docker images"
echo "----------------------------------------"
echo ""
echo ""
sudo docker images
