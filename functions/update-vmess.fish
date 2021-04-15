function update-vmess -d 'Update vmess subscription file'
    aria2c -o sub.txt $argv[1]
    cat sub.txt | vmess2json --parse_all --outbound
    for file in *.json
        mv $file (string replace -r '.json$' '_tail.json' $file)
    end
end
