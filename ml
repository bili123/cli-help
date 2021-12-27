[32m
                cli.help                   
       Hilfe im Terminal, auf Deutsch.     
 _____      _                          _   
|_   _|   _| |_ ___  _ __   __ _ _   _| |_ 
  | || | | | __/ _ \| '_ \ / _` | | | | __|
  | || |_| | || (_) | | | | (_| | |_| | |_ 
  |_| \__,_|\__\___/|_| |_|\__,_|\__,_|\__|

         curl cli.help/[31mSCHLAGWORT
[31m
###########################################
##            Über cli.help              ##
###########################################
[92mcli.help[0m bietet Hilfe für die Kommandozeile (Command Line 
Interface/CLI) und ist ein Projekt von Tutonaut.de. Weitere Infos unten.

[31m
###########################################
##            cheatsheet_mirco           ##
###########################################
[33m## Inhaltsverzeichnis

[92m1. Top 10
2. Nutzer & Rechte
3. Logik (if, while, Variablen etc.)
4. Aliasse (Meine Alias - als Anregung)
5. Dateien
6. Prozesse
7. Textverarbeitung (sed, awk, grep etc.)

[92mTop 10
[33m## Foobar
[31m foo [0m-bar

[33m## Rechte-Notationen - je für Besitzer, Gruppe, andere:
[31mOktal   Binär   Symbol   Menschlich[0m
0       000              nichts
1       001     x        ausführen
2       010     w        schreiben
3       011     rw       schreiben, lesen 
4       100     r        lesen
5       101     rx       lesen, ausführen
6       110     rw       lesen, schreiben 
7       111     rwx      lesen, schreiben, ausführen 

[92m2. Nutzer

[33m## Erstellen mit Home-Verzeichnis:
[31madduser [0m -m -G sudo,gruppe2 mirco

[33m## Passwort vergeben
[31mpasswd [0m mirco 

[33m## Nutzer zu Gruppe hinzufügen:
[31madduser [0m mirco sudo

[33m## Alle Gruppen auflisten
[31mcut[0m -d: -f1 /etc/group | [31msort[0m

[33m## Gruppen eines Nutzers auflisten:
[31mgroups [0m mirco

[33m## Besitzer von Dateien rekursiv ändern, Links als solche behandeln:
[31mchown [0m -hR mirco:gruppe2 /mein/verzeichnis

[33m## Gruppe von Dateien rekursiv ändern, Links als solche behandeln:
[31mchgrp [0m -hR gruppe2 /mein/verzeichnis

[33m## Erstellen mit Allem:
[31madduser [0m -b /home -c Mirco-Loginname -d /home/mirco-home -e 
2020-07-11 -g mirco-prime-group -G gruppe2,gruppe2 -k /kopiert/ordner/ins/home 
-m -s /bin/bash mirco

[33m## Alle Prozesse eines Nutzers killen.
[31mps [0m-aux | [31mgrep[0m tom | [31mawk[0m '{print $2}' | [31mxargs[0m kill -9

[33m## Nutzer sudo-Rechte für ein Programm einräumen:
[31m/etc/sudoers:[0m mirco debian=(root)NOPASSWD:/usr/bin/apt-get update

[92m3. Logik

[33m## Endlosschleife mit while: 
[31mwhile [0mtrue; do echo Hallo; done

[33m## Inkrementieren mit while:
[31mwhile [0m[ $a -lt 10 ]; do ((a++)) && echo Hallo $a; done

[33m## Wenn-Dann-Abfrage mit if:
[31mif [0m[ "$a" -lt 10 ]; then echo $a; else echo foobar; fi

[33m## Zahlen vergleichen - Variablen als "$var" schreiben:
[31m-eq, -ne, -gt, -ge, -lt, -le

[33m## Texte vergleichen - Variablen als "$var" schreiben:
[31m=, !=, <, >, -z und -n [0m(ist (nicht) null)

[33m## For-Schleife: Dateinamen ausgeben, die mit "ch" beginnen und ".txt" enden:
[31mfor [0ma in $(ls -R | egrep ^ch.*\.txt); do echo "Name: $a"; done

[92m4. Alias

[33m## Git-Arbeitsverzeichnis in Apache-Web-Root-Verzeichnis kopieren:
[0malias [31mf12[0m='sudo cp -rf /home/mirco/git/mlrepo/t3 /var/www/html/'

[33m## Git-Status mit Visualisierung, Satistik und kurzen Commit-Nummern:
[0malias [31mgitlog[0m='git log --stat --graph --abbrev-commit'

[33m## History einfacher durchsuchen:
[0malias [31mhisgrep[0m='history | grep '

[33m## Nummerierung bei nl-Ausgaben abschneiden:
[0malias [31mml_cutter[0m='cut -c7-'

[33m## Letzte Zeile löschen:
[0malias [31mml_deletelastline[0m='sed -i '\''$d'\'' '

[33m## Tastatur-Layout auf Deutsch:
[0malias [31mml_deutsch[0m='setxkbmap de'

[33m## Suche mit Ordnertiefe 3:
[0malias [31mml_find[0m='read -p "Suche mit Ordnertiefe 3:" && find ./ 
-maxdepth 3 -name "$p"'

[33m## Ins git-Verzeichnis wechseln:
[0malias [31mml_git[0m='cd /home/mirco/git'

[33m## Notiz zur Notizdatei hinzufügen:
[0malias [31mml_notiz[0m='read p && echo "- "$p >> ~/notizen'

[33m## Listet alle Nutzer samt Login-Namen, Home und Standard-Shell:
[0malias [31mml_user[0m='for f in $(cut -d: -f1 /etc/passwd) ; do finger $f 
| grep  -B1 bash ; done'

[33m## Infos zu Version, Speicher und Festplatten:
[0malias [31mml_version[0m='
        tput setaf 1 && echo Systeminfo: && tput sgr0 &&
        lsb_release -idrc &&
        tput setaf 1 &&  echo Kernel:&& tput sgr0 &&
        uname -r &&
        tput setaf 1 && echo Devices: && tput sgr0 &&
        lsblk -o NAME,SIZE,MOUNTPOINT | grep -v  ^loop &&
        tput setaf 1 && echo Speicherplatz: && tput sgr0 &&
        df -h --output=source,size,used,avail,target --exclude-type=tmpfs | 
grep -v ^\/dev\/loop'
		
[33m## Terminator mit gespeichertem Layout laden:
[0malias [31mterminator[0m='terminator -l ml_terminator-layout'

[92m5. Dateien 

[33m## Dateien mit Ausschlüssen auflisten:
[31m#ls[0m--ignore="foobar_*"

[33m## Nur Ordner auflisten:
[31mls[0m -d */

[33m## Dateien hübsch, der Größe nach und mit Ordnern zuerst anzeigen:
[31mls[0m -Sshg --group-directories-first

[33m## Unterordner mit Größen auflisten:
[31mdu[0m -hc --max-depth 1 ./*/ | [31msort[0m -n

[33m## Größe des aktuellen Ordners samt Unterordnern:
[31mdu[0m -hs ./ 

[33m## Eigenschaften aller txt-Dateien im aktuellen Ordner auflisten:
[31mls[0m *.txt | xargs stat

[33m## Serien-Piloten in VLC-Playlist einfügen, ohne nfo-Dateien:
[31mfind[0m medien/*Sitcoms* medien/Drama -name "*s01*e01*" -not -name "*.nfo" | [31mxargs[0m vlc 2>/dev/null

[33m## Kürzlich bearbeitete txt-Dateien ab aktuellem Order nach /temp kopieren:
[31mfind[0m ./ -mmin +5 -mmin -10  -name "*.txt" -exec sh -c 'cp {} temp' \;

[33m## txt-Dateien finden und löschen - dank + in einem Prozess:
[31mfind[0m ./ -name "*.txt" -exec rm {} +

[33m## foobar-Dateien umbenennen nach MUSTER_foobar.pdf (testen mit -n):
[31mls[0m | [31megrep[0m "foobar" | [31mrename[0m -n 's/\D*(xg\d{2})/$1_foobar.pdf/'

[33m## txt.-Dateien nummerieren:
[31mls[0m *.txt | [31mcat[0m -n | [31mwhile[0m read n f; do cp "$f" ./output/"$n-$f"; done

[33m## Verzeichnsstruktur mit 755-Rechten anlegen:
[31mmkdir[0m -m=755 -p /home/mirco/mein-archiv/201[0-9]

[33m## Mit dd kopieren und dd-Prozess-id in pid speichern:
[31mdd[0m if=/dev/zero of=/dev/null & pid=$!

[33m## Status des laufenden dd-Jobs einsehen:
[31mkill[0m -USR1 $pid

[92m7. Textverarbeitung

[33m## Dateien beim Durchsuchen ausschließen:
[31mgrep[0m--exclude "check*" ^SA: *

[33m## Text nach Match einfügen:
[31m#sed[0m-i '/^meinmatch:.*/a meintext' text.txt

[31m
###########################################
##            Über cli.help              ##
###########################################
Der Aufruf ist immer [92mcurl cli.help/[31mSCHLAGWORT[0m. Als Schlagwörter 
stehen zur Verfügung: [92malle GNU Core Utilities,[0m einige 
[92mLinux-Standard-Tools[0m und einige [92mcli.help-eigene Seiten:[0m

[33m## Startseite mit Infos über:[031
[31mstart, index, main, hilfe [0moder[31m help

[33m## Seite mit allen SCHLAGWÖRTERN als Liste:[31m
liste, befehle, kommandos, tools, programme [0moder[31m list

[33m## Seite mit ALLEN Hilfen zum Durchsuchen:[31m
alles, komplett [0moder[31m dump

[33m## Thematische Übersichten:[31m
nutzer, rechte, aliasse, dateien, ordner, text, textverarbeitung, suche,
prozesse, netzwerk, installieren, paketmanagement, pakete [0mund [31m upate.

[33m## Seite mit Aliassen - als Anregungen:[31m
aliasse

[33m## Seite mit persönlicher Befehlssammlung (cheat sheet):[31m
cheatsheet_mirco
cheatsheet[92m_DeinName[0m ## Schick uns Dein persönliches cheat sheet als 
Textdatei und wir stellen es unter [92mcli.help/cheatsheet_DeinName[0m 
öffentlich zur Verfügung: cli@tutonaut.de.


[31m
###########################################
##            <Temporäres>               ##
###########################################
[33m##Vorlage für eigene Einträge (siehe Quelltext):
[92m## KATEGORIE
[33m## NEU
[31m## KOMMANDO
[0m## NORMAL
[33m## Oder Suchen und Ersetzen (siehe Quelltext):
[92m: #kat
[33m: #neu
[31m: #cmd
[0m:  #00

[33m## NEU
[31m#cmd[0m-option

[0m
[33m
#kat## Top 10-20
#neu 
#cmd 
#00
[31m
###########################################
##            </Temporäres test>              ##
###########################################.
.
.
.
.
.
.
.
