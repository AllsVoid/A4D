#!/bin/bash

# 安装 Zsh
echo "正在安装 Zsh..."
sudo apt update && apt install zsh -y

# 设定 Zsh 为默认的 shell
chsh -s $(which zsh)

# 安装 Oh My Zsh
echo "正在安装 Oh My Zsh..."
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# 设置默认主题（替换为你喜欢的主题）
echo "设置 Zsh 主题..."
sed -i '/^ZSH_THEME=/c\ZSH_THEME="ys"' ~/.zshrc

# 安装插件（示例：git、zsh-autosuggestions、zsh-syntax-highlighting）
echo "安装插件..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
# zsh-com­ple­tions 插件需要另外添加内容
[ -z "`grep "autoload -U compinit && compinit" ~/.zshrc`" ] && echo "autoload -U compinit && compinit" >> ~/.zshrc
# 在 .zshrc 中启用插件
echo "启用插件..."
sed -i '/^plugins=/c\plugins=(git sudo z zsh-syntax-highlighting zsh-autosuggestions zsh-completions)' ~/.zshrc

# 重启 Zsh
echo "安装完成，重启 Zsh..."
source ~/.zshrc
