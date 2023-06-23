# 配置文件

> 按照{stow}这个软件的规则来上传的配置，也要使用stow来在电脑中使用配置

> stow => 管理软连接的软件 

1. ### 下载stow

```
sudo pacman -S stow
```

2. ### 克隆配置文件仓库

```
git clone https://github.com/pawnEkko/.dotfiles.git
```

3. ### 将想要同步的配置文件使用以下命令创建软链接

> 以i3wm为例

```
stow i3wm
```

---

### 以上已经完成配置，此处为部分我自己可能会忘记的东西PS:记性差

1. stow管理的是软连接所以，同步之后应该在源文件的位置也就是``.dotfile``中修改配置文件
2. polybar的配置中``lauch.sh``这个执行文件应该需要执权限才可以被i3调用，使用以下指令：

```
chmod 777 ~/.config/polybar/launch.sh
```
3. 部分NeoVim插件需要一些依赖、软件、或者环境存在才可以正常使用
> 使用以下代码安装
```
sudo pacman -S nodejs
sudo pacman -S yarn
sudo pacman -S rigrep
```
4. zsh使用oh-my-zsh管理插件 使用以下代码下载需要的插件
> 要在根目录使用`source ~/.zshrc`这个指令来执行zsh的各种配置
```
# 历史记录建议
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# 代码高亮
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
5. rofi要在终端中使用以下命令选择主题才可以应用   选择完成后要使用`Alt+a`确认选择
```
rofi-theme-selector
```

## 会使用更多的软件做更多的更新

