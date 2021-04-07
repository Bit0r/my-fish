#!/usr/bin/fish

sudo http_proxy='http://localhost:8800' apt install ttf-mscorefonts-installer

if ! type -q git-filter-repo
    proxy-wget2 -P /tmp 'https://launchpad.net/ubuntu/+archive/primary/+files/git-filter-repo_2.29.0-1_all.deb'
    sudo apt install /tmp/git-filter-repo_2.29.0-1_all.deb
end

proxy-wget2 -P /tmp 'https://download.calibre-ebook.com/linux-installer.sh'
sudo http_proxy='http://localhost:8800' sh /tmp/linux-installer.sh
