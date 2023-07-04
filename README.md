# 配置文件

> 按照**stow**这个软件的规则来上传的配置，也要使用stow来在电脑中使用配置

> stow => 管理软连接的软件 

> 部分软件不仅仅需要配置文件所以需要进行微调

## 目录
* [stow](#stow)
* [polybar](#polybar)
* [neovim](#neovim)
* [zsh](#zsh)
* [rofi](#rofi)
* [tmux](#tmux)


## stow
1. 在终端中使用以下命令stow
```
sudo pacman -S stow
```
2. 将想要同步的配置文件使用以下命令创建软链接(以i3wm为例)
```
stow i3wm
```
> stow管理的是软连接所以，同步之后应该在源文件的位置也就是``.dotfile``中修改配置文件
## polybar
2. polybar的配置中``lauch.sh``这个执行文件应该需要执权限才可以被i3调用，使用以下指令：
```
chmod 777 ~/.config/polybar/launch.sh
```
## neovim
> 部分NeoVim插件需要一些依赖、软件、或者环境存在才可以正常使用,使用以下代码安装
```
sudo pacman -S nodejs
sudo pacman -S yarn
sudo pacman -S rigrep
```
## zsh
> 安装完zsh之后记得在终端中更改默认shell为zsh：`chsh -s /bin/zsh`

1. 安装oh-my-zsh

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

2. 安装powerleve10k

```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
```
3. 在终端中使用以下命令下载插件
> 历史记录建议
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
> 代码高亮
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
````
在终端中使用`source ~/.zshrc`命令加载配置文件
## rofi
> 要在终端中使用以下命令选择主题才可以应用   选择完成后要使用`Alt+a`确认选择
```
rofi-theme-selector
```
## tmux
1.在终端中使用以下命令下载tmux的插件管理器
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
2.在tmux中使用`perfix`+`I`下载插件
3.在终端中使用`source ~/.tmux.conf`命令加载配置文件


## 会使用更多的软件做更多的更新

