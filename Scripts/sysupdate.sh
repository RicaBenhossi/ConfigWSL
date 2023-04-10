# !/bin/zsh

echo
echo "***********************************************************"
echo "*                                                         *"
echo "*                    UPDATING SYSTEM                      *"
echo "*                                                         *"
echo "***********************************************************"
echo
echo "============== Collecting packages to update =============="
echo
sudo apt update;
# Copy list of apps that has updates
sudo apt list --upgradable | sed '1d' >> ~/packages_with_updates
if [ -s ~/packages_with_updates ]; then
    have_updates=true
    echo "===================== Packages to update ===================="
    echo
    cat ~/packages_with_updates
    echo
else
    have_updates=false
fi
if [ "$have_updates" = true ]; then
    echo "==================== Performing update ===================="
    sudo apt dist-upgrade -y;
    echo
fi

#Clean up system
echo "==================== Cleaning up System ==================="
echo
sudo apt autoclean;
sudo apt clean;
sudo apt autoremove -y;
echo
if [ "$have_updates" = true ]; then
    echo "===================== Packages updated ===================="
    echo
    cat ~/packages_with_updates
    echo
fi
# Removing packages_wit_updates
echo "===================== Cleanning files ====================="
echo
echo "Removing packages_with_updates"
sudo rm -f ~/packages_with_updates;
echo "DONE"
echo
echo "Removing 0"
sudo rm -f ~/0;
sudo rm -f 0;

echo "DONE"
echo
echo "Removing nohup.out"
sudo rm -f ~/nohup.out;
sudo rm -f nohup.out;
echo "DONE"
echo
sleep 2s
echo "===================== Update finished ====================="
echo
