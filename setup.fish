#!/usr/bin/fish

source include/confirm.fish

# 安装基本配置
if confirm 'Do you want to install configs?'
    source config/variables.fish
    source config/alias.fish
    sudo mv ~/.config/fish/functions/* /etc/fish/functions/
    sudo cp functions/* /etc/fish/functions/
    sudo install python/* /usr/local/bin/
end

# 添加ppa
if confirm 'Do you want to add some ppa?'
    for ppa in (cat pkglist/ppa.txt)
        sudo add-apt-repository -ynP $ppa
    end
    sudo apt update
end

# 使用apt安装软件
source base.fish

# 进行软链接
if type yarnpkg &>/dev/null && ! type yarn &>/dev/null
    sudo ln -s /usr/share/nodejs/yarn/bin/yarn.js /usr/local/bin/yarn
end

# 给可执行文件设置一个“硬别名”
function hard-alias
    set target /usr/bin/$argv[2]
    set link_name /usr/local/bin/$argv[1]
    if [ -x $target -a ! -e $link_name ]
        sudo ln -s $target $link_name
    end
end

hard-alias cat bat
hard-alias ls exa

# 进行软件源配置
if confirm 'Do you want to configure software registries?'
    source registry.fish
end

# 使用包管理安装额外软件
if confirm 'Do you want to use external package manager to install some softwares?'
    source extra.fish
end

# 修改内核参数
if confirm 'Do you want to optimize kernel parameters?'
    sudo sh -c 'cat config/sysctl.conf >> /etc/sysctl.conf'
end

# 配置update-alternatives
if confirm 'Do you want to configure update-alternatives?'
    sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 40 --slave /usr/share/man/man1/python.1.gz python.1.gz /usr/share/man/man1/python3.1.gz
    sudo update-alternatives --install /usr/bin/editor editor /usr/bin/micro 80 --slave /usr/share/man/man1/editor.1.gz editor.1.gz /usr/share/man/man1/micro.1.gz
end

# 将用户附加到组
function groups-append
    set arg1 $argv[1]
    if grep "^$arg1:" /etc/group >/dev/null
        sudo usermod -aG $arg1 $USER
    else
        false
    end
end

# 添加自身到必需的组
if confirm 'Do you want to add yourself to some groups?'
    if groups-append www-data
        sudo chown www-data:www-data /var/www/
        sudo chmod 2775 /var/www/
    end
    groups-append wireshark
    groups-append docker
end

# 安装一些下载特别耗时的软件
if confirm 'Do you want to install some softwares that downloads very slowly?'
    source slow.fish
end