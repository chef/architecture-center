#!/bin/bash

echo ""
echo "How many go packages are installed? "
echo "--------"
hab pkg list core/go21
hab pkg list core/go22
echo ""


echo ""
echo "Checking the version on the Habitat managed Go"
echo "--------"
hab pkg exec core/go22 go -- version
hab pkg exec core/go21 go -- version
echo ""
