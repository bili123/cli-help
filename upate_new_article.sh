#!/bin/bash

notepad readme.md && echo Weiter ...
sed -i "/<\/body>/i <a href=\/$(basename $1)>$(basename $1)<\/a><br>" browser.html
sed -i "/\## Ende.*/i $(basename $1)" meta/{list,liste,befehle,kommandos,programme}
./ml_term-to-web $1 > html/$(basename $1).html
cat $1 | tee -a meta/{alles,dump,komplett}
git add . 
git commit -am "$1 hinzugefügt; Listen, Dumps und readme.md aktualisiert"
