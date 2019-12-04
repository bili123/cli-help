notepad readme.md && echo Weiter ...
echo "<a href=/"$1">"$1"</a><br>"}' >> browser.html
./ml_term-to-web $1 > html/$1.html
sed -i "/\## Ende.*/i $(basename $1)" meta/{list,liste,befehle,kommandos,programme}
git add . 
git commit -am "$1 hinzugefügt"
sftp open-source-elearning@open-source-elearning.de
