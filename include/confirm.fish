# 定义确认函数
function confirm
    read -P $argv[1]' [y/N] ' REPLY
    [ $REPLY = y ]
end
