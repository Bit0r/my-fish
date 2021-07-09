function update-hosts -d 'Set the Google Hosts file. Warning: this function will not back up the original hosts, please do it yourself'
    sudo aria2c --allow-overwrite -d /etc https://raw.githubusercontent.com/googlehosts/hosts/master/hosts-files/hosts
end
