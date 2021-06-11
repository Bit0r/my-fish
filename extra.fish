#!/usr/bin/fish

if type -q pip
    pip install -r pkglist/requirements.txt
end

if ! type -q client
    aria2c -d /tmp 'http://218.77.121.111/DownloadXml/ClientPkgs/64ac0526-0589-4ec9-9142-06db38ef3da2/HN-linux-clientV2-64.tar.gz'
    sudo unar -o /opt /tmp/HN-linux-clientV2-64.tar.gz
    sudo chmod -R 777 /opt/linux-clientV2.0-64/
end
