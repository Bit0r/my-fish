alias -s proxy-wget2 'wget2 --http-proxy=http://localhost:8800'
alias -s proxy-go 'http_proxy=http://localhost:8800 go'
alias -s proxy-curl 'curl -x socks5h://localhost'
alias -s proxy-apt 'apt -o Acquire::http::Proxy=http://localhost:8800 -o Acquire::https::Proxy=http://localhost:8800'
alias -s gdb 'gdb -quiet'
