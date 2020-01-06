#!/usr/bin/env bash
set -e
set -x

stat ~/.vim/bundle/Vundle.vim &>/dev/null || \
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

stat ~/.oh-my-zsh &>/dev/null ||  \
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

if ! which kubectl; then
    sudo apt-get update && sudo apt-get install -y apt-transport-https
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
    sudo apt-get update
    sudo apt-get install -y kubectl
fi

stat /opt/kubectx &>/dev/null || sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx

if [[ ! -e "/usr/local/bin/kubectx" ]]; then
    sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
fi

if [[ ! -e "/usr/local/bin/kubens" ]]; then
    sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens
fi
