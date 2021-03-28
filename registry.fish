#!/usr/bin/fish

if type pip >/dev/null
    sudo pip config --global set global.index-url 'https://repo.huaweicloud.com/repository/pypi/simple'
    sudo pip config --global set global.timeout 120
    sudo pip config --global set global.trusted-host 'repo.huaweicloud.com'
end

if type yarn >/dev/null
    yarn config set registry 'https://repo.huaweicloud.com/repository/npm/'
end
