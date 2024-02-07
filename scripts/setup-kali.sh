apt update 
apt install nala
apt install guake 
apt install chrome 
apt install vlc
apt install tmux
apt install ansible
apt install kubectl
apt install qbittorrent
#apt install anydesk


# Install and Config GIT
apt install git
git config --global user.name "Your Name"                   #REPLACE WITH YOUR NAME 
git config --global user.email "you@example.com"            #REPLACE WITH EMAIL 

# Install Vsode
apt install code

# Install Draw.io Integration
code --install-extension hediet.vscode-drawio

# Install GitHub Pull Request and Issues Extension
code --install-extension github.vscode-pull-request-github

# Install Makefile Tools Extension
code --install-extension nobuhito.printcode

# Install Terraform Extension
code --install-extension hashicorp.terraform

# Install Python Extension for Visual Studio Code
code --install-extension ms-python.python

# Install Docker Extension
code --install-extension ms-azuretools.vscode-docker

# Install Pdf Extension
code --install-extension tomoki1207.pdf

# Install Rootless Docker 
apt-get install uidmap -y
curl -fsSL https://get.docker.com/rootless | sh
echo "export DOCKER_HOST=unix:///run/user/1000/docker.sock" >> ~/.zshrc

# Download Docker Images
docker pull python:latest
docker pull ubuntu:latest

# Instaling Nekoray
wget -qO- https://raw.githubusercontent.com/ohmydevops/nekoray-installer/main/installer.sh | bash

apt install virtualbox virtualbox-ext-pack
apt upgrade -y
reboot now 








