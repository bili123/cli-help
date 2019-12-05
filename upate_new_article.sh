#!/bin/bash

notepad readme.md && echo Weiter ...
sed -i "/<\/body>/i <a href=\/$(basename $1)>$(basename $1)<\/a><br>" browser.html
./ml_term-to-web $1 > html/$(basename $1).html
sed -i "/\## Ende.*/i $(basename $1)" meta/{list,liste,befehle,kommandos,programme}
git add . 
git commit -am "$1 hinzugefügt"
