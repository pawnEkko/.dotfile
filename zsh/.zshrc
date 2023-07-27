# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
#
#
#
#
#
###################
#   自定义别名    #
###################
alias v='nvim'
alias vd='neovide'
alias nf='neofetch | lolcat'
alias cls='clear'
alias ll='ls -l'
alias la='ls -a'
alias lcat='lolcat'
alias tmuxk='tmux kill-session -t'
alias tmuxs='tmux switch -t'
alias tmuxa='tmux attach -t'
alias tmuxs='tmux switch -t'
alias tmuxn='tmux new -s'
alias tmuxl='tmux ls'


source ~/powerlevel10k/powerlevel10k.zsh-theme

##########################
#  关于hyprland的设置    #
##########################
# x11-i3环境下要注释掉
# 启动 wayland 桌面前设置一些环境变量
 function set_wayland_env
 {
  cd ${HOME}
  # 设置语言环境为中文
  export LANG=zh_CN.UTF-8
  # 解决QT程序缩放问题
  export QT_AUTO_SCREEN_SCALE_FACTOR=1
  # QT使用wayland和gtk
  export QT_QPA_PLATFORM="wayland;xcb"
  export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
  # 使用qt5ct软件配置QT程序外观
  export QT_QPA_PLATFORMTHEME=qt5ct

  # 一些游戏使用wayland
  export SDL_VIDEODRIVER=wayland
  # 解决java程序启动黑屏错误
  export _JAVA_AWT_WM_NONEREPARENTING=1
  # GTK后端为 wayland和x11,优先wayland
  export GDK_BACKEND="wayland,x11"

 }

 # 命令行输入这个命令启动hyprland,可以自定义
 function start_hyprland
 {
  set_wayland_env

  export XDG_SESSION_TYPE=wayland
  export XDG_SESSION_DESKTOP=Hyprland
  export XDG_CURRENT_DESKTOP=Hyprland
  # 启动 Hyprland程序
  exec Hyprland

 }





##################
#      插件      #
##################
plugins=(
  git
  zsh-autosuggestions  
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

########################
#  一些普通的环境变量  #
########################
export TERM='tmux-256color'
export EDITOR='nvim'
export VISUAL='nvim'
export LANGUAGE="zh_CN:UTF-8"

##############################
#       语言开发环境变量     #
##############################
#
#
# go语言开发环境变量
# export GOROOT=/usr/local/go
# export GOPATH=$HOME/go
# export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

