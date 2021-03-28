#!/usr/bin/fish

sudo http_proxy='http://localhost:8800' apt install ttf-mscorefonts-installer

if ! type git-filter-repo
    proxy-wget2 -O /tmp/git-filter-repo.deb 'https://launchpad.net/ubuntu/+archive/primary/+files/git-filter-repo_2.29.0-1_all.deb'
    sudo apt install /tmp/git-filter-repo.deb
end

proxy-wget2 -O /tmp/calibre.sh 'https://download.calibre-ebook.com/linux-installer.sh'
sudo http_proxy='http://localhost:8800' sh /tmp/calibre.sh
