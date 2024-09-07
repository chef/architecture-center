#!/bin/bash

echo ""
echo ""
echo "listing Docker (running) containers"
echo "----------------------------------------"
echo ""
echo ""
sudo docker ps -a

echo ""
echo ""
echo "listing Docker images"
echo "----------------------------------------"
echo ""
echo ""
sudo docker images

echo ""
echo ""
echo "listing Test Kitchens"
echo "----------------------------------------"
echo ""
echo ""
sudo kitchen list