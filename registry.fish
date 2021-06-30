#!/usr/bin/fish

if type -q pip
    sudo pip config --global set global.index-url 'https://repo.huaweicloud.com/repository/pypi/simple'
    sudo pip config --global set global.timeout 120
    sudo pip config --global set global.trusted-host 'repo.huaweicloud.com'
end

if type -q yarn
    yarn config set registry 'https://repo.huaweicloud.com/repository/npm/'
end

if type -q npm
    npm config set registry 'https://repo.huaweicloud.com/repository/npm/'
    npm cache clean -f
end
