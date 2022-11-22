echo
echo "***********************************************************"
echo "*                                                         *"
echo "*                   INSTALLING PACKAGES                   *"
echo "*                                                         *"
echo "***********************************************************"
echo
# Variables
config_folder="/home/$USER/ConfigWSL/Configs"
echo
echo "====================> Adding repositories to install"
echo
read -rp $"Press any key to Continue"
echo
sudo add-apt-repository universe -y &&
sudo add-apt-repository ppa:git-core/ppa -y &&
# sudo add-apt-repository ppa:deadsnakes/ppa &&
echo
echo "====================> Update and Dist Upgrade"
echo
read -rp $"Press any key to Continue"
echo
sudo apt update && sudo apt dist-upgrade -y &&
echo
# Package installation
echo
echo "====================> install software-properties-common"
echo
read -rp $"Press any to Continue"
echo
sudo apt install software-properties-common -y &&
echo
echo "====================> install CURL"
echo
read -rp $"Press any key to Continue"
echo
sudo apt install curl -y &&
echo
# echo "====================> install ssh-askpass"
# echo
# read -rp $"Press any to Continue"
# echo
# sudo apt install ssh-askpass -y &&
# echo
# echo "====================> install keychain"
# echo
# read -rp $"Press any to Continue"
# echo
# sudo apt-get install keychain -y &&
# echo
echo "====================> Install latest Git"
echo
read -rp $"Press any key to Continue"
echo
sudo apt install git -y &&
echo
echo "--------------------> Downloading .gitconfig file"
echo
cd ~
git clone git@gist.github.com:4fafb520ad03493ceac0a998e7c27f02.git git_config &&
rm -rf ~/.gitconfig
ln git_config/.gitconfig ~/ &&
echo
# echo "====================> Install Docker"
# echo
# echo '*** At the end of this installation, it will login with another user. Just type EXIT to keep running the script'
# echo
# read -rp $"Press any key to Continue"
# echo
# sudo apt update &&
# sudo apt install -y apt-transport-https ca-certificates curl gnupg2 &&
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&
# sudo apt-key fingerprint 0EBFCD88 &&
# sudo apt-add-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" -y &&
# sudo apt update &&
# sudo apt -y install docker-ce &&
# sudo usermod -aG docker ${USER}
# su - ${USER}
# id -nG
# echo
echo "====================> Install tree to terminal"
echo
read -rp $"Press any key to Continue"
echo
sudo apt install tree &&
echo
echo "====================> Install python pip"
echo
read -rp $"Press any key to Continue"
echo
sudo apt install python3-pip -y &&
echo
echo "====================> Install build essential"
echo
read -rp $"Press any key to Continue"
echo
sudo apt install build-essential -y &&
echo
echo "====================> Install asdf"
echo
read -rp $"Press any key to Continue"
echo
cd ~
git clone https://github.com/asdf-vm/asdf.git ~/.asdf &&
sudo apt install libedit-dev &&
sudo apt remove libssl-dev &&
sudo apt update &&
sudo apt install libssl-dev -y &&
echo
echo "====================> Install vim"
echo
read -rp $"Press any key to Continue"
echo
sudo apt install vim -y &&
echo
echo "====================> Install and configure ZSH"
echo
read -rp $"Press any key to Continue"
echo
sudo apt install zsh -y &&
sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh
echo
echo "--------------------> Install Oh my zsh"
echo
echo '*** It will open zsh at end of oh my zsh installation. Type EXIT to keep running the script'
echo
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo
echo "--------------------> Install powerline 10K (zsh theme)"
echo
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo
echo "--------------------> Configure files for zsh"
echo
rm -f ~/.zshrc;
rm -f ~/.sh_aliases;
rm -f ~/.p10k.zsh;
rm -f ~/.bashrc;
rm -f ~/.vimrc;
ln -s $config_folder/.zshrc ~/.zshrc;
ln -s $config_folder/.sh_aliases ~/.sh_aliases;
ln -s $config_folder/.p10k.zsh ~/.p10k.zsh;
ln -s $config_folder/.bashrc ~/.bashrc;
ln -s $config_folder/.vimrc ~/.vimrc;
echo
echo "--------------------> Configure zsh plugins"
echo
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &&
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting &&
echo
echo
echo "====================> Package install Finished"
echo
echo "====================> apt fix broken"
echo
read -rp $"Press any key to Continue"
echo
sudo apt --fix-broken install -y &&
echo
echo "====================> Clean up System"
echo
# Clean up the system
sudo apt clean &&
sudo apt autoclean &&
sudo apt autoremove -y &&
timeout 3
echo
echo "The system needs to be reloaded. Close WSL and open it again after finish."
read -rp $"Press any key to finish..."
echo