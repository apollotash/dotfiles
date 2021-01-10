echo "Would Yo Like To Copy 'libffmpeg' File :"
echo "For yes (y) or For no (n) then Enter"

read answer

if [ $answer = "y" ]
then
	sudo cp libffmpeg.so /usr/lib/opera

else
	exit

fi
