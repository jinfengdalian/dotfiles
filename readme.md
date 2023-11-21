# 安装说明

## 如何备份

1. 在本机建立git仓库

```
mkdir ~/dotfiles/
git init
```

2. 建立“点文件”链接

```
ln ~/.vimrc ~/dotfiles/.vimrc
```

上面的命令是把家目录的文件链接到 dotfiles 目录中。
ln命令可以建立软链接，也可以建立硬链接。我们这里建立硬链接。
网上有教程是把 dotfiles 链接到家目录，这样可以作软链接，优点是节省空间，缺点是以后修改只能修改 dotfiles 目录了。

3. 上传到 GitHub 

```
git add .
git commit -m "XXX"
git push origin_dotfiles main
```

origin_dotfiles 是我的远程库的名字。
main 是主分支。

## 如何恢复

