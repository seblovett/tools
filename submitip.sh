ip=$(lynx --dump http://ipecho.net/plain)
ip=$(echo $ip | tr -d " ")
#get old ip from file
if [ -f "ip.txt" ]
then
	echo "ip.txt found."
	ipold=$(cat ip.txt)
else
	#make file if it isn't there
	echo "ip.txt not found."
	echo $ip > ip.txt #and put the ip in it
	ipold="noip"
fi

if [ "$ip" = "$ipold" ]; then
	echo "ip not changed"
else
	lynx --dump http://www.seblovett.co.uk/ip.php?ip=${ip}
	#echo "Submitting ip" 
fi
echo $ip > ip.txt
