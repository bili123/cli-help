    #!/bin/bash
    
    notepad readme.md && echo Weiter ...
    
    for i in $@; do
    
        ## Link zur HTML-Seite in browser.html einfügen:
        sed -i "/<\/body>/i <a href=\/$(basename $i)>$(basename $i)<\/a><br>" browser.html
    	
        ## Programm in Alle-Programme-Listen eintragen:
        sed -i "/\## Ende.*/i $(basename $i)" meta/{list,liste,befehle,kommandos,programme}
        
    	## HTML-Seite erstellen:
        sed -re '
        s/^(.*)/\1\<br\>/g
        s/\[..?m//g
        s/#{43}//g
        s/## *(.*)##/\<H1\>\1\<\/H1\>\ncli\.help ist für den Terminal gedacht:\<br\>\<i\>curl cli\.help\<\/i\>/g
        ' "$i" | tail -n +20 > html/$(basename $i).html
        
    	## Text in Dumps anfügen:
        cat $i | tee -a meta/{alles,dump,komplett}
        
    	## Neue Dateien hinzufügen und Änderungen committen:
        git add . 
        git commit -am "$i hinzugefügt; Listen, Dumps und readme.md aktualisiert"
    
    done
