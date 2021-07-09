#!/usr/bin/fish

source include/confirm.fish

# 添加ppa
if confirm 'Do you want to add some ppa?'
    for ppa in (cat config/ppa.txt)
        sudo add-apt-repository -ynP $ppa
    end
    sudo apt update
end

# 添加外部源
if confirm 'Do you want to add other software sources?'
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo cp config/unit.list /etc/apt/sources.list.d/
end
