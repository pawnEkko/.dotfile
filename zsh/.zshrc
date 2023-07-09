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

