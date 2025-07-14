ip=$(curl -s https://ipinfo.io/ip | tr -d '[:space:]')
echo "Runner IP is $ip"
sleep 900
ip=$(curl -s https://ipinfo.io/ip | tr -d '[:space:]')
echo "Runner IP is $ip"

