ip=$(lynx --dump http://ipecho.net/plain)
ip=$(echo $ip | tr -d " ")
lynx --dump http://www.seblovett.co.uk/ip.php?ip=${ip}
