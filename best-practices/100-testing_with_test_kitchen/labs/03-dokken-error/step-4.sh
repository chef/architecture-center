#!/bin/bash

echo ""
echo ""
echo "Running Kitchen destroy"
echo "----------------------------------------"
echo ""
echo ""
sudo time kitchen destroy

echo ""
echo ""
echo "running Kitchen create"
echo "----------------------------------------"
echo ""
echo ""
sudo kitchen create