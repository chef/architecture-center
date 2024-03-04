echo ""
echo "configuring the lab"
echo "please note this may/will likely fail if executed outside of the Progress Chef Workshop Lab enviornment".

echo ""
echo "best-practices"
echo "---------------------------------------------"

echo ""
echo "setting up 100-testing_with_test_kitchen"
chmod +x ~/workshop/best-practices/100-testing_with_test_kitchen/labs/setup/configure.sh
~/workshop/best-practices/100-testing_with_test_kitchen/labs/setup/configure.sh

echo ""
echo "new-horizons"
echo "---------------------------------------------"

echo ""
echo "setting up 100-target-mode"
chmod +x ~/workshop/new-horizons/100-target-mode/labs/setup/configure.sh
~/workshop/new-horizons/100-target-mode/labs/setup/configure.sh

cd ~/workshop/new-horizons/100-courier/labs/setup
./setup.sh

/opt/openvscode-server/bin/openvscode-server --install-extension marp-team.marp-vscode
/opt/openvscode-server/bin/openvscode-server --install-extension rebornix.ruby
/opt/openvscode-server/bin/openvscode-server --install-extension redhat.vscode-yaml
/opt/openvscode-server/bin/openvscode-server --install-extension wingrunr21.vscode-ruby
